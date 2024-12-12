/*
 * @Author: wanglei 87789771@qq.com
 * @Date: 2024-05-11 10:34:07
 * @LastEditors: wanglei 87789771@qq.com
 * @LastEditTime: 2024-12-02 10:40:28
 * @FilePath: \meimei-new\src\modules\sys\sys-notice\dto\req-sys-notice.dto.ts
 * @Description:
 *
 */
import { IsNumber, IsOptional, IsString, IsArray } from 'class-validator';
import { DataBaseDto } from 'src/common/dto/data-base.dto';
import { PaginationDto } from 'src/common/dto/pagination.dto';
import { Transform, Type } from 'class-transformer';
/* 分页查询 */
export class GetSysPlanDto extends PaginationDto {
  /* 广告标题 */
  @IsOptional()
  @IsString()
  planName: string;

  @IsOptional()
  @Type()
  @IsNumber()
  userId?: number;

}

/* 新增 */
export class AddSysPlanDto extends DataBaseDto {
  @IsString()
  planName: string;

  // @IsString()
  // ids: string;

  @IsNumber()
  @Type()
  userId: number;

  @IsString()
  startTime?: Date | string;

  @IsString()
  endTime?: Date | string;

  @IsArray()
  userIds: number[];

  @IsArray()
  bookIds: number[];


  // @IsOptional()
  // @IsString()
  // noticeContent: string;

  // @IsString()
  // status: string;
}

/* 编辑 */
export class UpdateSysPlanDto extends AddSysPlanDto {
  @IsNumber()
  planId: number;
}
