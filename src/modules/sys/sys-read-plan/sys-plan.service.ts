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
  AddSysPlanDto,
  GetSysPlanDto,
  UpdateSysPlanDto,
} from './dto/req-sys-plan.dto';
import { CustomPrismaService, PrismaService } from 'nestjs-prisma';
import { ExtendedPrismaClient } from 'src/shared/prisma/prisma.extension';
import { ApiException } from 'src/common/exceptions/api.exception';

@Injectable()
export class SysBookPlanService {
  constructor(
    private readonly prisma: PrismaService,
    @Inject('CustomPrisma')
    private readonly customPrisma: CustomPrismaService<ExtendedPrismaClient>,
  ) { }
  /* 分页查询 */
  async list(GetSysPlanDto: GetSysPlanDto) {
    const { userId } = GetSysPlanDto;
    const contains = userId ? `,${userId},` : undefined;
    const { planName, } = GetSysPlanDto;

    const { total, rows } =
      await this.customPrisma.client.sysReadPlan.findAndCount({
        include: {
          sys_user: true
        },
        where: {
          AND: {

            planName: {
              contains: planName,
            },
            // createBy: {
            //   contains: createBy,
            // },
          }
        },
      });
    const newrows = rows.map((item) => {
      return Object.assign({}, item, {
        planName: item.planName.toString(),
      });
    });
    return { total, rows: newrows };
  }

  // /* 新增 */
  async add(AddSysPlanDto: AddSysPlanDto,) {
    const params: AddSysPlanDto = JSON.parse(JSON.stringify(AddSysPlanDto));
    delete params.userIds; // 删除不必要的传参
    return await this.prisma.sysReadPlan.create({
      data: {
        ...params,
        sys_user: {
          connect: AddSysPlanDto.userIds.map((userId) => ({ userId })),
        },
      }
    });
  }

  // /* 通过id查询 */
  async oneBybookId(planId: number) {
    return await this.prisma.sysReadPlan.findUnique({
      include: {
        sys_user:true
      },
      where: {
        planId,
      },
    });
    
  }

  // /* 更新 */
  async update(updateSysPlanDto: UpdateSysPlanDto) {


    return await this.prisma.$transaction(async (prisma) => {
      const { planId } = updateSysPlanDto;
      const notice = await prisma.sysReadPlan.findUnique({
        where: {
          planId,
        },
      });
      if (!notice) throw new ApiException('该记录不存在，请重新查询后操作。');

      const params: AddSysPlanDto = JSON.parse(JSON.stringify(updateSysPlanDto));
      delete params.userIds; // 删除不必要的传参

       await prisma.sysReadPlan.update({
      data: {
        ...params,
        sys_user: {
          set: updateSysPlanDto.userIds.map((userId) => ({ userId })),
        },
 
      },
      where: {
        planId,
      },

      });
    });
  }

  /* 删除公告 */
  async delete(bookIdArr: number[]) {
    await this.prisma.sysBookList.deleteMany({
      where: {
        bookId: {
          in: bookIdArr,
        },
      },
    });
  }

  /* 查询岗位和角色列表 */

async Usersfind() {
  return await Promise.all([
    this.prisma.sysUser.findMany({}),
 
  ]);
}


}
