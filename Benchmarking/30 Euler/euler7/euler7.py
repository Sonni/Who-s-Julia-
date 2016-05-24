import sys

def isPrime(x):
	divisor = 2
	prime = True
	while divisor < x:
		if x % divisor == 0:
			prime = False
			break
		divisor += 1
	return prime
	
def findPrime(primeNumber):
	arrayPrimes = []
	counter = 0
	number = 2
	while counter < primeNumber:
		if isPrime(number):
			counter += 1
			if counter == primeNumber:
				break
    		number += 1
	if counter == primeNumber:
		return number

primeNumber = int(sys.argv[1])
print findPrime(primeNumber)
