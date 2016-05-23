import sys

limit = int(sys.argv[1])

def getPrimes(size):
	array = [True for i in range(size+1)]
	array[0] = False
	for i in range(2, size+1):
		if array[i]:
			j = i + i
			while j <= size:
				array[j] = False
				j += i
	return array

def calc(limit):
  primes = getPrimes(limit)
  maxSeq = 0
  maxPrime = 0
  for i in range(2, limit):
    sum = 0
    seq = 0
    for j in range(i, limit):
      if primes[j] == True:
        sum += j
        seq += 1
        if sum > limit:
          break
        if primes[sum] == True:
          if seq > maxSeq:
            maxSeq = seq
            maxPrime = sum
  return maxPrime

print calc(limit)
