import { Controller, Get, Post, Body, Param, Put, Patch, Delete } from '@nestjs/common';
import { ProductService } from './product.service';

@Controller('products')
export class ProductsController {
    constructor(private readonly productsService: ProductService) {

    }

    @Post()
    async addProduct(
        @Body('title') prodTitle: string, 
        @Body('description') description: string, 
        @Body('price') prodPrice: number
    ) {

        const generatedId = await this.productsService.insertProduct(prodTitle, description, prodPrice);
        return {
            id: generatedId
        };
    }

    @Get() 
    async getAllProducts() {
        const products = await this.productsService.fetchProducts();
        return products;
    }

    @Get(':id')
    async getProduct(@Param('id') prodId: string) {
        const product = await this.productsService.getSingleProduct(prodId);
        return product;
    }

    @Patch(':id')
    async updateProduct(
        @Param('id') prodId: string, 
        @Body('title') prodTitle: string,
        @Body('description') prodDescription: string,
        @Body('price') prodPrice: number
    ) {
        await this.productsService.updateProduct(prodId, prodTitle, prodDescription, prodPrice);
        return null;
    }

    @Delete(':id')
    async removeProduct(@Param('id') prodId: string) {
        await this.productsService.deleteProduct(prodId);
    }
}