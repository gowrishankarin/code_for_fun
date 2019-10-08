#include <iostream>
#include <cassert>

int fibonacci_naive(int n) {
    if(n <= 1) {
        return n;
    }

    return fibonacci_naive(n - 1) + fibonacci_naive(n - 2);
}

int fibonacci_fast(int num) {
    if(num <= 1) {
        return num;
    }

    long long prev_sum = 1;
    long long sum = 1;

    for(int i = 2; i < num; i++) {
        long long tmp = sum;
        sum += prev_sum;
        prev_sum = tmp;
    }

    return sum;
}


int main() {
    int num, num2;
    std::cin >> num >> num2;

    // std::cout << fibonacci_naive(num) << " ";
    std::cout << fibonacci_fast(num) % num2;
}