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

template<class T1, class T2>
void convert_type(const vector<T1>* src_array, vector<T2>* dst_array) {
    for(int i=0; i < src_array->size(); i++) {
        dst_array->push_back(static_cast<T2>(src_array->at(i)));
    }
}

template<class Printable>
void print_array(const vector<Printable>*    array) {
    for(int i=0; i < array->size(); i++) {
        cout << array->at(i) << endl;
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

    std::vector<double> dst_array;
    convert_type(&array, &dst_array);

    cout << "Sum is " << total << endl;
    cout << "Integer:"  << sizeof(array.at(0))<< endl;
    cout << "Double:" << sizeof(dst_array.at(0)) << endl;
    
    return 0;
}
