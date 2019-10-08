#include <iostream>
#include <vector>

long long lcm_naive(int a, int b) {
    for(long l=1; l <= (long long)a*b; ++l) {
        if(l%a == 0 && l%b == 0) {
            return l;
        }
    }
    return (long long)a*b;
}

int find_gcd(long long &num1, long long &num2) {
    int remainder = -1;
    int gcd = -1;

    while(remainder) {
        remainder = num1 % num2;
        num1 = num2;
        num2 = remainder;
    }

    return num1;
}

long long lcm_fast(long long a, long long b) {

    if(a * b == 0) {
        return 0;
    }

    return a * b / find_gcd(a, b);
}

int main() {
    long long a, b;
    std::cin >> a >> b;
    //std::cout << lcm_naive(a, b) << std::endl;
    std::cout << lcm_fast(a, b);
    
    return 0;
}