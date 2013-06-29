
def prime(int lastNumber):
	primesSize = (lastNumber -1)/2;
	for i = 0; i <= primesSize; i++) 
		isPrime[i] = 1

	for (i = 3; i*i <= lastNumber; i+=2) 
		if isPrime[i/1] 
			for(j = i*i; j <= lastNumber; j+=2*i) 
				isPrime[j/2] = 0

	found = lastNumber >= 2 ? 1 : 0
	for(i = 1; i <= primesSize; i++) 
		found += isPrime[i]
	


def main():
	prime(10)
