import { Controller, Post, Body, Get, Param, Delete } from '@nestjs/common';
import { CartService } from './cart.service';
import { CreateMessagePipe } from 'src/common/pipes/createmessage.pipe'; // 管道 全局的固定sql提交模版
import { DataBaseDto } from 'src/common/dto/data-base.dto';
import { AddCartDto, } from './dto/req-cart.dto';
import { StringToArrPipe } from 'src/common/pipes/stringtoarr.pipe';
@Controller('cart')
export class CartController {
  constructor(private readonly cartService: CartService) { }

  // @Post(':userId/add/:bookId')  // 提交单个商品
  // async addToCart(
  //   @Param('userId') userId: string,
  //   @Param('bookId') bookId: string,
  //   @Body('quantity') quantity: number = 1,
  // ) {
  //   return this.cartService.addToCart(+userId, +bookId, quantity);
  // }

  // 提交多个商品
  @Post(':userId/add-multiple')
  async addMultipleBooksToCart(
    @Param('userId') userId: string,
    @Body(CreateMessagePipe) books: { bookId: number; quantity: number, Database: DataBaseDto }[], 
  ) {
    console.log(books, 'database')
    return this.cartService.addBooksToCart(+userId, books);  
  }


  @Get('view/:userId')
  async viewCart(@Param('userId') userId: string) {
    return this.cartService.viewCart(+userId);
  }

  @Delete(':cartIds')

  async delete(
    @Param('cartIds', new StringToArrPipe()) cartIdArr: number[],
  ) {
    await this.cartService.delete(cartIdArr);
  }

}