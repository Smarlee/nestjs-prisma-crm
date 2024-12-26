/*
 * @Author: wanglei 87789771@qq.com
 * @Date: 2024-05-11 10:34:07
 * @LastEditors: wanglei 87789771@qq.com
 * @LastEditTime: 2024-12-02 10:40:28
 * @FilePath: \meimei-new\src\modules\sys\sys-notice\dto\req-sys-notice.dto.ts
 * @Description:
 *
 */
import { IsNumber, IsOptional, IsString } from 'class-validator';
import { DataBaseDto } from 'src/common/dto/data-base.dto';
import { PaginationDto } from 'src/common/dto/pagination.dto';
import { Excel } from 'src/modules/common/excel/excel.decorator';
/* 分页查询 */
export class GetSysBookListDto extends PaginationDto {
  /* 广告标题 */
  @IsOptional()
  @IsString()
  bookName: string;


  @IsOptional()
  @IsString()
  menuType: string;
}

/* 新增 */
export class AddSysNoticeDto extends DataBaseDto {
  @IsString()
  @Excel({
    name: '图书名称',
  })
  bookName: string;

  @IsString()
  @Excel({
    name: '图书价格',
  })
  price: string;

  @IsString()
  @Excel({
    name: '图书类型',
    dictType: 'sys_book_type',
  })
  menuType: string;

  @IsString()
  bookPic: string;

  // @IsOptional()
  // @IsString()
  // noticeContent: string;

  // @IsString()
  // status: string;
}

/* 编辑 */
export class UpdateSysNoticeDto extends AddSysNoticeDto {
  @IsNumber()
  bookId: number;
}
