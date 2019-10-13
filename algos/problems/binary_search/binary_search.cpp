#include <iostream>
#include <cassert>
#include <vector>
#include <cmath>

int binary_search(const std::vector<int> &a, int x) {
    int left = 0; 
    int right = (int)a.size();

    int mid = a[floor(right / 2)];
    if(mid < x) {
        left = mid;
        std::vector<int> a1(a.begin() + left, a.end());
        return binary_search(a1, x);
    } else if (mid == x) {
        return mid;
    } else {
        right = mid;
        std::vector<int> a1(a.begin(), a.begin() + right);
        return binary_search(a1, x);
    }
    

    return -1;
}

int linear_search(const std::vector<int> &a, int x) {

    for(size_t i = 0; i < a.size(); ++i) {
        if(a[i] == x) {
            return i;
        }
    }

    return -1;
}


int main() {
    int n;
    std::cin >> n;
    std::vector<int> a(n);
    for(size_t i = 0; i < a.size(); i++) {
        std::cin >> a[i];
    }

    int m;
    std::cin >> m;
    std::vector<int> b(m);
    for(int i=0; i < m; ++i) {
        std::cin >> b[i];
    }

    for(int i=0; i < m; ++i) {
        std::cout << linear_search(a, b[i]) << ' ';
    }
}