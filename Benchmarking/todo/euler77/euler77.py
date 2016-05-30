import sys

ways = int(sys.argv[1])

def getPrimes(size):
	array = [True for i in xrange(size + 1)]
	array[1] = False
	c = 1
	for i in xrange(2, size + 1):
		if array[i] == True:
			j = i + i
			while j <= size:
				array[j] = False
				j += i
			c += 1
	primeArray = []
	for i in xrange(2, size + 1):
		if(array[i]):
			primeArray.append(i)
	return primeArray

def calc(ways):
	i = 2
	while True:
	  arr = [0 for j in xrange(i + 1)]
	  arr[0] = 1
	  primes = getPrimes(i)

	  for p in primes:
	    for j in xrange(p, len(arr)):
	      arr[j] += arr[j - p]
	  if arr[i] > ways:
	    return i
	  i += 1

print calc(ways)
