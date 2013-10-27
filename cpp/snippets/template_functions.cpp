// Use iostream instead of stdio
#include <iostream>
// Vector or list is suitable for array operation.
#include <vector>

using namespace std;

// N is Total number of elements in the array.
const int N = 40; 

// Function to calculate sum of any summable vector array.
template<class Summable>
void sum(Summable *total, const vector<Summable>* values) {
    *total = 0;
    for(int i=0; i < values->size(); ++i) {
        *total += values->at(i);
    }
}

int main()
{
    // Total will hold the sum of the array.
    int total = 0;
    
    // Variable array is populated with numbers in sequence of 0 to 39.
    vector<int> array;
    for(int i = 0; i < N; ++i) {
       array.push_back(i);
    }
    
    sum(&total, &array);   
    cout << "Sum is " << total << endl;
    
    return 0;
}
