import sys

cons = int(sys.argv[1])
limit = int(sys.argv[2])

def numFactors(number, primeList):
  nod = 0
  pf = False
  remain = number
  for i in range(0, len(primeList)):
    if primeList[i] * primeList[i] > number:
      nod += 1
      return nod
    pf = False
    while remain % primeList[i] == 0:
      pf = True
      remain = remain / primeList[i]
    if pf:
      nod += 1
    if remain == 1:
      return nod
  return nod

def getPrimes(size):
	array = [True for i in range(size+1)]
	c = 1
	for i in range(2, size):
		if array[i]:
			j = i + i
			while j <= size:
				array[j] = False
				j += i
			c += 1
	primeArray = []
	for i in range(2, size+1):
		if(array[i]):
			primeArray.append(i)
	return primeArray

def calc(limit, consec):
  primeList = getPrimes(limit)
  targetpf = consec
  targetcons = consec
  cons = 1
  result = 1
  while cons < targetcons:
    result += 1
    if numFactors(result, primeList) >= targetpf:
      cons += 1
    else:
      cons = 0
  return result-3

print calc(limit, cons)
