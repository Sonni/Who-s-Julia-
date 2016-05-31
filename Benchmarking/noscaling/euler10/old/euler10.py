import sys

limit = int(sys.argv[1])
def isPrime(x):
	divisor = 2
	prime = True
	while divisor < x:
		if x % divisor == 0:
			prime = False
			break
		divisor += 1
	return prime

def sumPrime(n):
	sum = 0
	for i in range(2,n):
		if isPrime(i):
			sum += i
	return sum
	
print sumPrime(limit)
