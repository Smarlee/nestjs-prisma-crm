import { Inject, Injectable, Req } from '@nestjs/common';

import { SysUserService } from 'src/modules/sys/sys-user/sys-user.service';
import { CustomPrismaService, PrismaService } from 'nestjs-prisma';
import { ExtendedPrismaClient } from 'src/shared/prisma/prisma.extension';
import { ApiException } from 'src/common/exceptions/api.exception';
import { SharedService } from 'src/shared/shared.service';
import { DataBaseDto } from 'src/common/dto/data-base.dto';
@Injectable()
export class CartService {
  // constructor(private SysUserService: SysUserService) { }
  constructor(
    private readonly prisma: PrismaService,
    @Inject('CustomPrisma')
    private readonly customPrisma: CustomPrismaService<ExtendedPrismaClient>,
    private readonly sharedService: SharedService,
    private readonly SysUserService: SysUserService,
  ) { }
  async addToCart(userId: number, bookId: number, quantity: number = 1) {
    return this.SysUserService.addCartItem(userId, bookId, quantity);
  }

  async addBooksToCart(userId: number, books: { bookId: number; quantity: number, Database: DataBaseDto }[],) {

    const cartItems = [];
    let { createBy, createTime } = books


    for (const { bookId, quantity, Database } of books) {
      const existingItem = await this.prisma.cartItem.findFirst({
        where: { userId, bookId },
      });

      if (existingItem) {
        // 更新现有购物车项的数量
        await this.prisma.cartItem.update({
          where: { id: existingItem.id },
          data: { quantity: existingItem.quantity + quantity },
        });
        cartItems.push({ ...existingItem, quantity: existingItem.quantity + quantity });
      } else {
        // const data = Object.assign({}, addSysNoticeDto,);
        // 创建新的购物车项
        const newItem = await this.prisma.cartItem.create({
          data: Object.assign({ userId, bookId, quantity, createBy, createTime })  
        });
        cartItems.push(newItem);
      }
    }

    return cartItems;
  }

  async viewCart(userId: number) {
    return this.SysUserService.getCartItems(userId);
  }

  async updatePaymentStatus(userId: number, cartItemId: number, status: 'PAID' | 'CANCELLED') {
    // 确保这是用户的购物车项
    const cartItem = await this.SysUserService.getCartItems(userId).then(items =>
      items.find(item => item.id === cartItemId),
    );

    if (!cartItem) throw new ApiException('Cart item not found or does not belong to the user');


    return this.SysUserService.updatePaymentStatus(cartItemId, status);
  }


  /* 删除公告 */
  async delete(cartIdArr: number[]) {
    await this.prisma.cartItem.deleteMany({
      where: {
        id: {
          in: cartIdArr,
        },
      },
    });
  }




}