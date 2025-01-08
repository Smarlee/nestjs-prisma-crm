import { Module } from '@nestjs/common';
import { CartController } from './cart.controller';
import { CartService } from './cart.service';
import { SysUserModule } from 'src/modules/sys/sys-user/sys-user.module';
@Module({
  imports: [SysUserModule],
  controllers: [CartController],
  providers: [CartService]
})
export class CartModule { }
