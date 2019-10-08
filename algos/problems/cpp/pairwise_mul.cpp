#include <iostream>
#include <vector>

long long MaxPairwiseProduct(const std::vector<long long>& numbers) {
    long long max_product = 0;
    long long size = numbers.size();

    for(int i = 0; i < size; ++i) {
        for(long long j = i + 1; j < size; ++j) {
            max_product = std::max(max_product, numbers[i] * numbers[j]);
        }
    }

    return max_product;
}

long long MaxPairwiseProduct_Fast(const std::vector<long long>& numbers) {
    long long max_product = 0;
    long long size = numbers.size();

    long long max_1 = -1;
    long long max_2 = -1;
    long long index_to_ignore = -1;
    
    for(long long i = 0; i < size; i++) {
        if(numbers[i] > max_1) {
            max_1 = numbers[i];
            index_to_ignore = i;
        }
    }

    for(long long i = 0; i < size; i++) {
        if(numbers[i] > max_2 && i != index_to_ignore) {
            max_2 = numbers[i];
        }
        
    }

    return max_1 * max_2;
}




int main() {
    long long n;
    std::cin >> n;
    std::vector<long long> num(n);
    for(int i = 0; i < n; i++) {
        std::cin >> num[i];
    }
    std::cout << MaxPairwiseProduct_Fast(num);
    return 0;
}