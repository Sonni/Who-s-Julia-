import sys

limit = int(sys.argv[1])

def getPrimes(size):
  array = [True for i in xrange(size + 1)]
  for i in xrange(2, size + 1):
    if array[i] == True:
      j = i + i
      while j <= size:
        array[j] = False
        j += i
  return array

def calc(limit):
  count = 0
  primes = getPrimes(limit)

  for num in xrange(2, limit + 1):
    q = False
    num = str(num)
    for i in xrange(0, len(num)):
      index = int(num[i:] + num[:-len(num) + i])
      if primes[index]:
        q = True
      else:
        q = False
        break
    if q:
      count += 1
  return count

print calc(limit)









