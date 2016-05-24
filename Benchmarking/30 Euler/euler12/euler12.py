import sys
import math

numDiv = int(sys.argv[1])

def divisors(n):
	numFactors = 0
	ceiling = 2147483647
	for i in range(1, int(math.ceil(math.sqrt(n)+1))+1):
		if n % i == 0:
			numFactors += 2
		if i * i == n:
			numFactors -= 1
	return numFactors

def triangular(numDiv):
	ceil = 32767
	for n in range(1, ceil+1):
		k = int((n * (n + 1)) / 2)
		if n % 2 == 0:
			count = divisors(n / 2) * divisors(n + 1)
		else:
			count = divisors(n) * divisors((n + 1) / 2)
		if count > numDiv:
			return k

print triangular(numDiv) 
