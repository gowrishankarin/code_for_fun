import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  //@Get('product')
  getProduct(): string {
    return this.appService.getProduct();
  }

  //@Get('products')
  getProducts(): string {
    return this.appService.getProducts();
  }
}
