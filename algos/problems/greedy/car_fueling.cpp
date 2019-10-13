#include <iostream>
#include <vector>
#include <cmath>

int compute_min_refills_naive(int dist, int tank, std::vector<int> & stops) {

    if(dist > tank ) {
        return 0;
    }

    int numRefill = 0;

    if(stops.size() >= numRefill) {
        return numRefill;
    }

    int remaining_stops = stops.size();
    int dist_traveled = 0;

    for(int i=0; i < stops.size(); i++) {
        if(stops[i+1] < dist) {
            dist_traveled -= stops.at(i);
            continue;
        } else {
            dist_traveled = 0;
            numRefill++;
        }

        
    }


    return -1;
}

int compute_min_refills(int dist, int tank, std::vector<int> & stops) {

    int numRefill = 0;
    int currentRefill = 0;
    //int lastRefill = 0;
    int num_stops = stops.size();
    

    
    while(currentRefill <= stops.size()) {
        int lastRefill = currentRefill;
        
        while((currentRefill <= stops.size()) && (stops[currentRefill + 1] - stops[lastRefill] <= tank)) {
            currentRefill++;
        }
        if(currentRefill == lastRefill) {
            return -1;
        }
        if(currentRefill <= num_stops) {
            num_stops--;
            numRefill++;
        }
    }

    return numRefill;
}

int main() {
    int d = 0;
    std::cin >> d;
    int m = 0;
    std::cin >> m;
    int n = 0;
    std::cin >> n;

    std::vector<int> stops(n);

    for(size_t i = 0; i < n; ++i) {
        std::cin >> stops.at(i);
    }

    std::cout << compute_min_refills(d, m, stops) << std::endl;
}