import sys

ways = int(sys.argv[1])
limit = int(sys.argv[2])

def getPrimes(size):
	array = [True] * (size + 1)
	array[1] = False
	c = 1
	for i in range(2, size + 1):
		if array[i]:
			j = i + i
			while j <= size:
				array[j] = False
				j += i
			c += 1
	primeArray = []
	for i in range(2, size + 1):
		if(array[i]):
			primeArray.append(i)
	return primeArray

def calc(ways, limit):
  primes = getPrimes(limit)
  target = 2
  while True:
    way = [0 for i in range(target + 2)]
    way[1] = 1

    for i in range(0, len(primes)):
      for j in range(primes[i], target + 1):
        way[j + 1] += way[j + 1 - primes[i]]
    if way[target] > ways:
      return target - 1
    target += 1

print calc(ways, limit)
