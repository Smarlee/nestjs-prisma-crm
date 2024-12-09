import { Module } from '@nestjs/common';
import { SysBookController } from './plan-progress.controller';
import { planProgressService } from './plan-progress.service';

@Module({
  controllers: [SysBookController],
  providers: [planProgressService]
})
export class planProgressModule { }
