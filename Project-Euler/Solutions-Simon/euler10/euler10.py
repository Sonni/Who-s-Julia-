import sys

limit = int(sys.argv[1])

def getPrimes(size):
	array = [True] * (size + 1)
	c = 1
	for i in range(2, size + 1):
		if array[i]:
			j = i + i
			while j < size:
				array[j] = False
				j += i
			c += 1
	primeArray = []
	for i in range(2, size + 1):
		if(array[i]):
			primeArray.append(i)
	return primeArray
	
print sum(getPrimes(limit))
