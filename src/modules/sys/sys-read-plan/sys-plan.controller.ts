/*
 * @Author: jiang.sheng 87789771@qq.com
 * @Date: 2024-05-11 20:53:17
 * @LastEditors: JiangSheng 87789771@qq.com
 * @LastEditTime: 2024-05-15 17:22:44
 * @FilePath: \meimei-new\src\modules\sys\sys-notice\sys-notice.controller.ts
 * @Description:
 *
 */
import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
  Query,
} from '@nestjs/common';
import { RequiresPermissions } from 'src/common/decorators/requires-permissions.decorator';
import { PaginationPipe } from 'src/common/pipes/pagination.pipe';
import {
  AddSysPlanDto,
  GetSysPlanDto,
  UpdateSysPlanDto,
} from './dto/req-sys-plan.dto';
import { SysBookPlanService } from './sys-plan.service';
import { BusinessTypeEnum, Log } from 'src/common/decorators/log.decorator';
import { RepeatSubmit } from 'src/common/decorators/repeat-submit.decorator';
import { CreateMessagePipe } from 'src/common/pipes/createmessage.pipe';
import { DataObj } from 'src/common/class/data-obj.class';
import { UpdateMessagePipe } from 'src/common/pipes/updatemessage.pipe';
import { StringToArrPipe } from 'src/common/pipes/stringtoarr.pipe';

@Controller('system/bookPlan')
export class SysBookController {
  constructor(private readonly SysBookPlanService: SysBookPlanService) { }

  /* 新增 */
  @Post()
  @RepeatSubmit()
  @Log({
    title: '图书计划',
    businessType: BusinessTypeEnum.insert,
    isSaveRequestData: false,
  })
  @RequiresPermissions('system:bookList:add')
  async add(@Body(CreateMessagePipe) AddSysPlanDto: AddSysPlanDto) {
    await this.SysBookPlanService.add(AddSysPlanDto);
  }

  /* 分页查询 */
  @Get('list')
  @RequiresPermissions('system:bookList:query')
  async list(@Query(PaginationPipe) GetSysPlanDto: GetSysPlanDto) {
    return await this.SysBookPlanService.list(GetSysPlanDto);
  }

  /* 通过id查询 */
  @Get(':planId')
  @RequiresPermissions('system:bookList:query')
  async oneByBookId(@Param('planId') planId: number) {
    const plan = await this.SysBookPlanService.oneBybookId(planId);

    const [sys_user] = await this.SysBookPlanService.Usersfind();
    const userIds = plan.sys_user.map((item) => item.userId);
    const bookIds = plan.books.map((item) => item.bookId);
    return {
      data: {...plan,bookIds},
      sys_user,
      userIds
    }
    // return DataObj.create(notice);
  }

  // /* 更新 */
  @Put()
  @RepeatSubmit()
  @RequiresPermissions('system:bookList:edit')
  @Log({
    title: '图书计划',
    businessType: BusinessTypeEnum.update,
    isSaveRequestData: false,
  })
  async uplate(
    @Body(UpdateMessagePipe) UpdateSysPlanDto: UpdateSysPlanDto,
  ) {
    await this.SysBookPlanService.update(UpdateSysPlanDto);
  }

  /* 删除 */
  @Delete(':planIds')
  @RequiresPermissions('system:bookList:remove')
  @Log({
    title: '公告管理',
    businessType: BusinessTypeEnum.delete,
  })
  async delete(
    @Param('planIds', new StringToArrPipe()) planIdArr: number[],
  ) {
    await this.SysBookPlanService.delete(planIdArr);
  }
}
