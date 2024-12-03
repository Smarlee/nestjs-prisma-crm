import { Module } from '@nestjs/common';
import { SysBookController } from './sys-book.controller';
import { SysBookService } from './sys-book.service';

@Module({
  controllers: [SysBookController],
  providers: [SysBookService]
})
export class SysBookModule { }
