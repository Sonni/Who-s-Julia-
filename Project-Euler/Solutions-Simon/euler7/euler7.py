def isPrime(x):
	divisor = 2
	prime = True
	while divisor < x:
		if x % divisor == 0:
			prime = False
			break
		divisor += 1
	return prime
	
def findPrime():
	arrayPrimes = []
	counter = 0
	number = 2
	primeNumber = 10001
	while counter < primeNumber:
		if isPrime(number):
			counter += 1
			if counter == primeNumber:
				break
    		number += 1
	arrayPrimes.append(number)
	print arrayPrimes[-1]

findPrime()
