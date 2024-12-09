在 NestJS 中结合 Prisma 操作 MySQL 数据库，并实现生成阅读计划、每个计划可以关联多名用户，以及通过定时任务动态更新计划并生成计划详情表，可以按照以下步骤进行：

## 1. 设置项目结构
首先，确保你的项目结构如下：
```bash
src/
├── app.module.ts
├── prisma/
│   └── schema.prisma
├── reading-plan/
│   ├── reading-plan.module.ts
│   ├── reading-plan.service.ts
│   ├── reading-plan.entity.ts
│   ├── reading-plan.dto.ts
│   └── reading-plan.controller.ts
├── user/
│   ├── user.module.ts
│   ├── user.service.ts
│   ├── user.entity.ts
│   └── user.controller.ts
└── schedule/
    ├── schedule.module.ts
    └── schedule.service.ts
```
## 2. 定义 Prisma 模型
在 prisma/schema.prisma 文件中定义你的模型：

model ReadingPlan {
  id         Int       @id @default(autoincrement())
  name       String
  startDate  DateTime
  endDate    DateTime
  users      User[]    @relation("ReadingPlanUser")
  createdAt  DateTime  @default(now())
  updatedAt  DateTime  @updatedAt
}

model User {
  id         Int       @id @default(autoincrement())
  name       String
  email      String    @unique
  readingPlans ReadingPlan[] @relation("ReadingPlanUser")
  createdAt  DateTime  @default(now())
  updatedAt  DateTime  @updatedAt
}

model ReadingPlanDetail {
  id         Int       @id @default(autoincrement())
  readingPlanId Int
  userId     Int
  progress   Int
  completed  Boolean
  createdAt  DateTime  @default(now())
  updatedAt  DateTime  @updatedAt

  readingPlan ReadingPlan @relation(fields: [readingPlanId], references: [id])
  user        User        @relation(fields: [userId], references: [id])
}
## 3. 生成 Prisma 客户端
运行以下命令生成 Prisma 客户端：

npx prisma generate
## 4. 创建模块和服务
reading-plan.module.ts
import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { ReadingPlanService } from './reading-plan.service';
import { ReadingPlanController } from './reading-plan.controller';

@Module({
  providers: [ReadingPlanService, PrismaService],
  controllers: [ReadingPlanController],
})
export class ReadingPlanModule {}
reading-plan.service.ts
import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateReadingPlanDto } from './dto/create-reading-plan.dto';

@Injectable()
export class ReadingPlanService {
  constructor(private prisma: PrismaService) {}

  async create(createReadingPlanDto: CreateReadingPlanDto) {
    const { name, startDate, endDate, userIds } = createReadingPlanDto;

    const readingPlan = await this.prisma.readingPlan.create({
      data: {
        name,
        startDate,
        endDate,
        users: {
          connect: userIds.map(userId => ({ id: userId })),
        },
      },
    });

    return readingPlan;
  }

  async updateProgress(readingPlanId: number, userId: number, progress: number, completed: boolean) {
    await this.prisma.readingPlanDetail.upsert({
      where: { readingPlanId_userId: { readingPlanId, userId } },
      update: { progress, completed },
      create: { readingPlanId, userId, progress, completed },
    });
  }
}
reading-plan.controller.ts
import { Controller, Post, Body } from '@nestjs/common';
import { ReadingPlanService } from './reading-plan.service';
import { CreateReadingPlanDto } from './dto/create-reading-plan.dto';

@Controller('reading-plans')
export class ReadingPlanController {
  constructor(private readonly readingPlanService: ReadingPlanService) {}

  @Post()
  async create(@Body() createReadingPlanDto: CreateReadingPlanDto) {
    return this.readingPlanService.create(createReadingPlanDto);
  }
}
## 5. 创建定时任务
schedule.module.ts
import { Module, ScheduleModule } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { ReadingPlanService } from 'src/reading-plan/reading-plan.service';
import { ScheduleService } from './schedule.service';

@Module({
  imports: [ScheduleModule.forRoot()],
  providers: [ScheduleService, PrismaService, ReadingPlanService],
})
export class ScheduleModule {}
schedule.service.ts
import { Injectable, OnModuleInit } from '@nestjs/common';
import { Cron } from '@nestjs/schedule';
import { PrismaService } from 'src/prisma/prisma.service';
import { ReadingPlanService } from 'src/reading-plan/reading-plan.service';

@Injectable()
export class ScheduleService implements OnModuleInit {
  constructor(
    private prisma: PrismaService,
    private readingPlanService: ReadingPlanService,
  ) {}

  onModuleInit() {
    // 初始化定时任务
  }

  @Cron('0 0 * * *') // 每天午夜执行
  async updateReadingPlans() {
    const now = new Date();
    const plans = await this.prisma.readingPlan.findMany({
      where: {
        endDate: { lte: now },
      },
    });

    for (const plan of plans) {
      const users = await this.prisma.user.findMany({
        where: {
          readingPlans: {
            some: {
              id: plan.id,
            },
          },
        },
      });

      for (const user of users) {
        await this.readingPlanService.updateProgress(plan.id, user.id, 100, true);
      }
    }
  }
}
## 6. 配置 Prisma 服务
prisma/prisma.service.ts
import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService extends PrismaClient {
  constructor() {
    super();
  }

  async onModuleInit() {
    await this.$connect();
  }

  async enableShutdownHooks(app: any) {
    this.$on('beforeExit', async () => {
      await app.close();
    });
  }
}
## 7. 注册模块
在 app.module.ts 中注册 ReadingPlanModule 和 ScheduleModule：

import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './prisma/prisma.service';
import { ReadingPlanModule } from './reading-plan/reading-plan.module';
import { ScheduleModule } from './schedule/schedule.module';

@Module({
  imports: [ReadingPlanModule, ScheduleModule],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}