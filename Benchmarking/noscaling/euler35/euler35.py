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
	return primeArray, array

def rotate(s):
  first = s[0]
  last = s[1:]
  return last + first

def calc(limit):
  primes, primesBool = getPrimes(limit)
  count = 0
  for p in primes:
    s = str(p)
    l = len(s)
    circPrime = True
    for i in xrange(1, l):
      s = rotate(s)
      n = int(s)
      if not(primesBool[n]):
        circPrime = False
        break
    if circPrime:
      count += 1
  return count
  
calc(limit)
