#include <algorithm>
#include <iostream>
#include <vector>

int get_majority_elelment(std::vector<int> &a, int left, int right) {
    if(left == right) {
        return -1;
    }

    if(left+1 == right) {
        return a[left];
    }

    return -1;

}

int main() {
    int n;
    std::cin >> n;
    std::vector<int> a(n);

    for(size_t i=0; i<a.size(); i++) {
        std::cin >> a[i];
    }

    std::cout << (get_majority_elelment(a, 0, a.size()) != -1) << std::endl;
}