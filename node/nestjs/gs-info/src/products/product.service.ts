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

    async insertProduct(title: string, desc: string, price: number) :Promise<string> {
        const newProduct =  new this.productModel({title: title, description: desc, price: price});
        const result = await newProduct.save();
        
        return result.id as string;
    }

    async fetchProducts() {
        const products = await this.productModel.find().exec();
        return products.map((prod) => ({
            id: prod.id, 
            title: prod.title, 
            description: prod.description, 
            price: prod.price
        }));
    }

    async getProduct(productId: string): Promise<Product> {
        let product;
        try {
            product = await this.productModel.findById(productId).exec();
        } catch(error) {
            throw new NotFoundException('Could not find product.');
        }
        
        if(!product) {
            throw new NotFoundException('Could not find product.');
        }

        return product;
    }

    async getSingleProduct(productId: string) {
        const product = await this.getProduct(productId);
        return {
            id: product.id,
            title: product.title,
            description: product.description,
            price: product.price
        };
    }
 
    async updateProduct(productId: string, title: string, desc: string, price: number) {
        const updatedProduct = await this.getProduct(productId);
        
        if (title) {
            updatedProduct.title = title;
        }

        if(desc) {
            updatedProduct.description = desc;
        }
        if(price) {
            updatedProduct.price = price;
        }
        updatedProduct.save();
    }

    async deleteProduct(productId: string) {
        const result = await this.productModel.deleteOne({
            _id: productId
        }).exec();

        if(result.n === 0) {
            throw new NotFoundException('Failed to delete the Product')
        }
    }
}