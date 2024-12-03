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
  AddSysNoticeDto,
  GetSysBookListDto,
  UpdateSysNoticeDto,
} from './dto/req-sys-book.dto';
import { SysBookService } from './sys-book.service';
import { BusinessTypeEnum, Log } from 'src/common/decorators/log.decorator';
import { RepeatSubmit } from 'src/common/decorators/repeat-submit.decorator';
import { CreateMessagePipe } from 'src/common/pipes/createmessage.pipe';
import { DataObj } from 'src/common/class/data-obj.class';
import { UpdateMessagePipe } from 'src/common/pipes/updatemessage.pipe';
import { StringToArrPipe } from 'src/common/pipes/stringtoarr.pipe';

@Controller('system/bookList')
export class SysBookController {
  constructor(private readonly SysBookService: SysBookService) { }

  // /* 新增 */
  // @Post()
  // @RepeatSubmit()
  // @Log({
  //   title: '图书类别管理',
  //   businessType: BusinessTypeEnum.insert,
  //   isSaveRequestData: false,
  // })
  // @RequiresPermissions('system:bookList:add')
  // async add(@Body(CreateMessagePipe) addSysNoticeDto: AddSysNoticeDto) {
  //   await this.SysBookService.add(addSysNoticeDto);
  // }

  /* 分页查询 */
  @Get('list')
  @RequiresPermissions('system:bookList:query')
  async list(@Query(PaginationPipe) GetSysBookListDto: GetSysBookListDto) {
    return await this.SysBookService.list(GetSysBookListDto);
  }

  /* 通过id查询 */
  // @Get(':noticeId')
  // @RequiresPermissions('system:bookList:query')
  // async oneByNoticeId(@Param('noticeId') noticeId: number) {
  //   const notice = await this.sysNoticeService.oneByNoticeId(noticeId);
  //   return DataObj.create(notice);
  // }

  // /* 更新 */
  // @Put()
  // @RepeatSubmit()
  // @RequiresPermissions('system:bookList:edit')
  // @Log({
  //   title: '公告管理',
  //   businessType: BusinessTypeEnum.update,
  //   isSaveRequestData: false,
  // })
  // async uplate(
  //   @Body(UpdateMessagePipe) updateSysNoticeDto: UpdateSysNoticeDto,
  // ) {
  //   await this.sysNoticeService.update(updateSysNoticeDto);
  // }

  // /* 删除 */
  // @Delete(':noticeIds')
  // @RequiresPermissions('system:bookList:remove')
  // @Log({
  //   title: '公告管理',
  //   businessType: BusinessTypeEnum.delete,
  // })
  // async delete(
  //   @Param('noticeIds', new StringToArrPipe()) noticeIdArr: number[],
  // ) {
  //   await this.sysNoticeService.delete(noticeIdArr);
  // }
}
