#include <iostream>

int sum_of_2_numbers(int num1, int num2) {
    return num1 + num2;
}

// g++ -pipe -O2 -std=c++11 ./AplusBB.cpp

int main() {
    int num1, num2;
    std::cin >> num1;
    std::cin >> num2;
    int sum = sum_of_2_numbers(num1, num2);
    std::cout << sum;
    return 0;
}