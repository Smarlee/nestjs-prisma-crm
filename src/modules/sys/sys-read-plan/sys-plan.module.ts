import { Module } from '@nestjs/common';
import { SysBookController } from './sys-plan.controller';
import { SysBookService } from './sys-plan.service';

@Module({
  controllers: [SysBookController],
  providers: [SysBookService]
})
export class SysPlanModule { }
