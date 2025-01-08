import { Controller, Post, Body, Get, Param } from '@nestjs/common';
import { CartService } from './cart.service';

@Controller('cart')
export class CartController {
  constructor(private readonly cartService: CartService) { }

  @Post(':userId/add/:bookId')  // 提交单个商品
  async addToCart(
    @Param('userId') userId: string,
    @Param('bookId') bookId: string,
    @Body('quantity') quantity: number = 1,
  ) {
    return this.cartService.addToCart(+userId, +bookId, quantity);
  }

  // 提交多个商品
  @Post(':userId/add-multiple')
  async addMultipleBooksToCart(
    @Param('userId') userId: string,
    @Body() books: { bookId: number; quantity: number }[],
  ) {
    return this.cartService.addBooksToCart(+userId, books);
  }


  @Get('view/:userId')
  async viewCart(@Param('userId') userId: string) {
    return this.cartService.viewCart(+userId);
  }
}