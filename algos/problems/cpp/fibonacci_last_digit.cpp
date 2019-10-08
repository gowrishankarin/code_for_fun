#include <iostream>
#include <cassert>
#include <vector>

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

    long long int prev_sum = 1;
    long long int sum = 1;

    std::vector<int> digits(60);
    digits[0]=0;
    digits[1]=1;
    digits[2]=1;
    
    for(int i = 3; i < 61; i++) {
        long long int tmp = sum;
        sum += prev_sum;
        prev_sum = tmp;
        digits[i] = sum % 10;
    }

    return digits[num % 60];
}


int main() {
    int num;
    std::cin >> num;
    std::cout << fibonacci_fast(num);
}