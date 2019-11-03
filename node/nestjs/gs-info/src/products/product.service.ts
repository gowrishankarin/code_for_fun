import { Injectable, NotFoundException } from '@nestjs/common';
import {InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';

import { Product } from './product.model';

@Injectable()
export class ProductService {
    private products: Product[] = [];
    
    constructor(
        @InjectModel('Product')  private readonly productModel: Model<Product>
    ) {

    }

    async insertProduct(title: string, desc: string, price: number) {
        const newProduct =  this.productModel({title: title, description: desc, price: price});
        const result = await newProduct.save();
        
        return result.id as string;
    }

    fetchProducts() {
        return [...this.products];
    }

    getSingleProduct(productId: string) {
        const product = this.products.find((prod) => prod.id == productId);
        if(!product) {
            throw new NotFoundException('Could not find product.');
        }
        return { ...product };
    }

    private findProduct(id: string): [Product, number] {
        const productIndex = this.products.findIndex(prod => prod.id === id);
        const product = this.products[productIndex];
        if(!product) {
            throw new NotFoundException('Could not find product');
        }
        return [product, productIndex];
    }
 
    updateProduct(productId: string, title: string, desc: string, price: number) {
        const [product, index] = this.findProduct(productId);
        const updatedProduct = {...product};

        if (title) {
            updatedProduct.title = title;
        }

        if(desc) {
            updatedProduct.description = desc;
        }
        if(price) {
            updatedProduct.price = price;
        }
        this.products[index] = updatedProduct;
    }

    deleteProduct(productId: string) {
        const [product, index] = this.findProduct(productId);
        this.products.splice(index, 1);
    }
}