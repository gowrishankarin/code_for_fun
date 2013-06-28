#include <iostream>
#include <math.h>
#include <unistd.h>
#include <ctime>
#include <sys/time.h>

using namespace std;

long long prime(long long lastNumber) {
	long primesSize = (lastNumber -1)/2;
	char* isPrime = new char[primesSize+1];
	for(long long i = 0; i <= primesSize; i++) {
		isPrime[i] = 1;
	}

	for (long long i = 3; i*i <= lastNumber; i+=2) {
		if(isPrime[i/2]) {
			for(long long j = i*i; j <= lastNumber; j+=2*i) {
				isPrime[j/2] = 0;
			}
		}
	}


	long long found = lastNumber >= 2 ? 1 : 0;
	for(long long i = 1; i <= primesSize; i++) {
		found += isPrime[i];
	}

	delete [] isPrime;
	return found;
};


int main() {

	for(int i = 10; i <= 30; i++) {
		
		timeval startTime, endTime;
		
		gettimeofday(&startTime, 0);
		long long primeCount = prime(pow(2, i));
		gettimeofday(&endTime, 0);
		std::cout << "Prime Count: " << primeCount << " Duration: " << (endTime.tv_usec - startTime.tv_usec)/1000 << std::endl;
		
	}
}
