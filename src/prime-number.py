from time import time
import math

def prime(lastNumber):
	primesSize = (lastNumber -1)/2;
	isPrime = []
	for i in range(1,lastNumber):
		isPrime.append(1)

	index = 3
	while (index**2 <= lastNumber):
		if isPrime[index/2] == 1:
			jIndex = index**2
			while (jIndex <= lastNumber):
				isPrime[jIndex/2] = 0
				jIndex += 2*index
		index += 2
			

	found = 0
	if lastNumber >= 2 :
		found = 1
	for i in range(primesSize): 
		found += isPrime[i]
	
	return found

def prime_calculator():
	index = 10
	while( index <= 27):
		startTime = time()
		primeCount = prime(2**index)
		endTime = time()
		print "Duration: " + str(math.ceil((endTime-startTime)*1000)) + "Range: " + str(2**index) + ", Prime Count: " + str(primeCount)
		index += 1

prime_calculator()
