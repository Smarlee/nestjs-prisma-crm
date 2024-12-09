/*
 * @Author: JiangSheng 87789771@qq.com
 * @Date: 2024-05-11 10:32:53
 * @LastEditors: JiangSheng 87789771@qq.com
 * @LastEditTime: 2024-05-11 15:33:13
 * @FilePath: \meimei-new\src\modules\sys\sys-notice\sys-notice.service.ts
 * @Description: 
 * 
 */
import { Inject, Injectable } from '@nestjs/common';
import {
  AddProgressDto,
  GetPlanProgressDto,
  UpdateSysNoticeDto,
} from './dto/req-plan-progress.dto';
import { CustomPrismaService, PrismaService } from 'nestjs-prisma';
import { ExtendedPrismaClient } from 'src/shared/prisma/prisma.extension';
import { ApiException } from 'src/common/exceptions/api.exception';

@Injectable()
export class planProgressService {

  constructor(
    private readonly prisma: PrismaService,
    @Inject('CustomPrisma')
    private readonly customPrisma: CustomPrismaService<ExtendedPrismaClient>,
  ) { }
  /* 分页查询 */
  async list(GetPlanProgressDto: GetPlanProgressDto) {
    const { planId, userId } = GetPlanProgressDto;

    const { total, rows } =
      await this.customPrisma.client.planProgress.findAndCount({
        include: {
          user: true,
          plan: true
        },
        where: {
          planId,
          userId,

          // createBy: {
          //   contains: createBy,
          // },
        },
      });
    const newrows = rows.map((item) => {
      return Object.assign({}, item,);
    });
    return { total, rows: newrows };
  }

  async generateProgressReports(): Promise<void> {
    const plans = await this.prisma.sysReadPlan.findMany({
      where: {
        endTime: { lte: new Date() }, // 获取所有已完成的计划
      },
      include: { progresses: true },
    });

    for (const plan of plans) {
      for (const progress of plan.progresses) {
        if (!progress.completed && new Date() > plan.endTime) {
          await this.prisma.planProgress.update({
            where: { progressId: progress.progressId },
            data: { completed: true },
          });
        }
      }
    }
  }

  async updateProgress(planId: number, userId: number, progress: number, completed: boolean) {
    await this.prisma.planProgress.upsert({
      where: {
        planId_userId: {
          planId,
          userId,
        },

      },
      update: { progress, completed },
      create: { planId, userId, progress, completed },
    });
  }

  // /* 新增 */
  async add(AddProgressDto: AddProgressDto) {
    // const data = Object.assign({}, AddProgressDto,);
    // return await this.prisma.planProgress.create({
    //   data
    // });
  }



  /* 删除公告 */
  // async delete (progressIdArr: number[]) {
  //     await this.prisma.planProgress.deleteMany({
  //       where: {
  //         progressId: {
  //           in: progressIdArr,
  //         },
  //       },
  //     });
  //   }
}
