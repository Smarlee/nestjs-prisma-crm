/*
 * @Author: wanglei 87789771@qq.com
 * @Date: 2024-05-11 10:34:07
 * @LastEditors: wanglei 87789771@qq.com
 * @LastEditTime: 2024-12-02 10:40:28
 * @FilePath: \meimei-new\src\modules\sys\sys-notice\dto\req-sys-notice.dto.ts
 * @Description:
 *
 */
import { IsNumber, IsOptional, IsString, IsBoolean } from 'class-validator';
import { Transform, Type } from 'class-transformer';
import { DataBaseDto } from 'src/common/dto/data-base.dto';
import { PaginationDto } from 'src/common/dto/pagination.dto';

/* 分页查询 */
export class GetPlanProgressDto extends PaginationDto {
  /* 广告标题 */
  @IsOptional()
  @IsNumber()
  userId?: number;

  @IsOptional()
  @IsNumber()
  planId: number;
}

/* 新增 */
export class AddProgressDto extends DataBaseDto {

  @IsNumber()
  @Type()
  userId: number;

  @IsNumber()
  @Type()
  planId: number;

  @IsNumber()
  progress: number;

  @IsOptional()
  @IsBoolean()
  completed?: boolean;

  // @IsOptional()
  // @IsString()
  // noticeContent: string;

  // @IsString()
  // status: string;
}

/* 编辑 */
export class UpdateProgressDto extends AddProgressDto {
  @IsNumber()
  progressId: number;
}
