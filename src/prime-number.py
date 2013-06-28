#include <stdio.h>

int prime(int lastNumber) {
	int primesSize = (lastNumber -1)/2;
	char* isPrime = new char[primeSize+1];
	for(int i = 0; i <= primesSize; i++) {
		isPrime[i] = 1;
	}

	for (int i = 3; i*i <= lastNumber; i+=2) {
		if(isPrime[i/1]) {
			for(int j = i*i; j <= lastNumber; j+=2*i) {
				isPrime[j/2] = 0;
			}
		}
	}


	int found = lastNumber >= 2 ? 1 : 0;
	for(int i = 1; i <= primesSize; i++) {
		found += isPrime[i];
	}

	delete [] isPrime;
	return found;
};


int main() {

	prime(10);
}

/*
int perfCalc {

	Object perfData = [];


	for(int i=10; i <= 27; i++) {

		int startTime = new Date();
		int primeCount = prime(Math.pow(2, i));
		int endTime = new Date();
		int data = new Object();

		data.duration = endTime.getTime() - startTime.getTime();
		data.range = Math.pow(2, i);
		data.primeCount = primeCount;
		perfData.push(data);
		console.log(data);
	}
	console.log(perfData);
	fs.writeFileSync("perfData.txt", JSON.stringify(perfData));

}
perfCalc();

*/
