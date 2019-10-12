# include <iostream>
#include <vector>
#include <cmath>

int get_change(int m, const std::vector<int>& denoms) {

    int coin_count = 0;
    int remainder = m;

    for(int i=denoms.size(); i > 0 ; i--) {
        coin_count += floor(remainder / denoms[i - 1]); 
        remainder = remainder % denoms[i-1];
    }
    return coin_count;
}

int main() {
    int m;
    std::cin >> m;
    std::vector<int> denoms(3);
    denoms[0] = 1;
    denoms[1] = 5;
    denoms[2] = 10;
    std::cout << get_change(m, denoms) << std::endl;
}