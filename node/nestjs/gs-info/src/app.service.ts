import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World!';
  }

  getProduct(): string {
    return 'Hello Product!';
  }

  getProducts(): string {
    return 'Hello Productss!';
  }
}
