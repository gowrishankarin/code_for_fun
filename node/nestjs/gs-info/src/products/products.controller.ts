import { Controller, Get, Post, Body, Param, Put, Patch, Delete } from '@nestjs/common';
import { ProductService } from './product.service';

@Controller('products')
export class ProductsController {
    constructor(private readonly productsService: ProductService) {

    }

    @Post()
    addProduct(
        @Body() completeBody: {
            title: string, 
            description: string, 
            prodPrice: number
        }

    ): any {
        const generatedId = this.productsService.insertProduct(
            completeBody.title, completeBody.description, completeBody.prodPrice);

        return {
            id: generatedId
        };
    }

    @Get() 
    getAllProducts() {
        return this.productsService.fetchProducts();
    }

    @Get(':id')
    getProduct(@Param('id') prodId: string) {
        return this.productsService.getSingleProduct(prodId);
    }

    @Patch(':id')
    updateProduct(
        @Param('id') prodId: string, 
        @Body('title') prodTitle: string,
        @Body('description') prodDescription: string,
        @Body('price') prodPrice: number
    ) {
        this.productsService.updateProduct(prodId, prodTitle, prodDescription, prodPrice);
        return null;
    }

    @Delete(':id')
    removeProduct(@Param('id') prodId: string) {
        this.productsService.deleteProduct(prodId);
    }
}