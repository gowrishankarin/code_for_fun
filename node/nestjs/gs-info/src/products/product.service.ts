import { Injectable, NotFoundException } from '@nestjs/common';
import { Product } from './product.model';

@Injectable()
export class ProductService {
    private products: Product[] = [];

    consturctor() {

    }

    insertProduct(title: string, desc: string, price: number): string {
        const prodId = Math.random().toString();
        const newProduct = new Product(prodId, title, desc, price);
        this.products.push(newProduct);
        return prodId;
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