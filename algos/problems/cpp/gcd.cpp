#include <iostream>
#include <cstdlib>

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


// int main(int argc, char *argv[]) {
//     long long num1 = atoi(argv[1]);
//     long long num2 = atoi(argv[2]);

//     std::cout << num1 << std::endl;
//     std::cout << num2 << std::endl;

//     int gcd = find_gcd(num1, num2);
//     std::cout << gcd << std::endl;
//     std::cout << num1 << " " << num2 << std::endl;
// }

int main() {
    long long num1;
    long long num2;

    std::cin >> num1;
    std::cin >> num2;

    std::cout << find_gcd(num1, num2);

}