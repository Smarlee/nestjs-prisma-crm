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
  AddProgressDto,
  GetPlanProgressDto,
  UpdateProgressDto,
} from './dto/req-plan-progress.dto';
import { planProgressService } from './plan-progress.service';
import { BusinessTypeEnum, Log } from 'src/common/decorators/log.decorator';
import { RepeatSubmit } from 'src/common/decorators/repeat-submit.decorator';
import { CreateMessagePipe } from 'src/common/pipes/createmessage.pipe';
import { DataObj } from 'src/common/class/data-obj.class';
import { UpdateMessagePipe } from 'src/common/pipes/updatemessage.pipe';
import { StringToArrPipe } from 'src/common/pipes/stringtoarr.pipe';
import { User } from 'src/common/decorators/user.decorator';
@Controller('system/planProgress')
export class SysBookController {
  constructor(private readonly planProgressService: planProgressService) { }

  /* 新增 */
  @Post()
  @RepeatSubmit()
  @Log({
    title: '图书管理',
    businessType: BusinessTypeEnum.insert,
    isSaveRequestData: false,
  })
  @RequiresPermissions('system:bookList:add')
  async add(@Body(CreateMessagePipe) AddProgressDto: AddProgressDto) {
    await this.planProgressService.add(AddProgressDto);
  }

  /* 分页查询 */
  @Get('list')
  @RequiresPermissions('system:planProgress:query')
  async list(@Query(PaginationPipe) GetPlanProgressDto: GetPlanProgressDto) {
    return await this.planProgressService.list(GetPlanProgressDto);
  }

  @Get('selflist')
  @RequiresPermissions('system:planProgress:query')
  // 调用装饰器 @user
  async selflist(@Query(PaginationPipe) GetPlanProgressDto: GetPlanProgressDto, @User() currentUser: any) {
    return await this.planProgressService.selflist(GetPlanProgressDto, currentUser);
  }

  // /* 通过id查询 */
  // @Get(':bookId')
  // @RequiresPermissions('system:bookList:query')
  // async oneByBookId(@Param('bookId') bookId: number) {
  //   const notice = await this.planProgressService.oneBybookId(bookId);
  //   return DataObj.create(notice);
  // }

  // /* 更新 */
  @Put()
  @RepeatSubmit()
  @RequiresPermissions('system:planProgress:edit')
  @Log({
    title: '图书管理',
    businessType: BusinessTypeEnum.update,
    isSaveRequestData: false,
  })
  async uplate(
    @Body(UpdateMessagePipe) UpdateProgressDto: UpdateProgressDto,
  ) {
    await this.planProgressService.update(UpdateProgressDto);
  }

  // /* 删除 */
  // @Delete(':bookIds')
  // @RequiresPermissions('system:bookList:remove')
  // @Log({
  //   title: '公告管理',
  //   businessType: BusinessTypeEnum.delete,
  // })
  // async delete(
  //   @Param('bookIds', new StringToArrPipe()) bookIdArr: number[],
  // ) {
  //   await this.planProgressService.delete(bookIdArr);
  // }
}
