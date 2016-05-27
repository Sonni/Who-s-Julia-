import sys

primeNumber = int(sys.argv[1])
limit = int(sys.argv[2])

def getPrimes(size):
	array = [True for i in range(size + 1)]
	array[1] = False
	c = 1
	for i in xrange(2, size + 1):
		if array[i] == True:
			j = i + i
			while j <= size:
				array[j] = False
				j += i
			c += 1
	return array

def calc(primeNumber, limit):
  primes = getPrimes(limit)
  count = 0
  k = 1
  for i in xrange(1, primes.size + 1):
    if primes[i]:
      count += 1
    if count == primeNumber:
      return i

print calc(primeNumber, limit)
