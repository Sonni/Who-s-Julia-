import sys

limit = int(sys.argv[1])

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

sum(getPrimes(limit))
