import { Module } from '@nestjs/common';
import { SysBookController } from './sys-plan.controller';
import { SysBookPlanService } from './sys-plan.service';

@Module({
  controllers: [SysBookController],
  providers: [SysBookPlanService]
})
export class SysPlanModule { }
