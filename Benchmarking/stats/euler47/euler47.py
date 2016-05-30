import sys

cons = int(sys.argv[1])
dist = int(sys.argv[2])

def prime_factors(n):
  factors = []
  d = 2
  while n > 1:
    while n % d == 0:
      factors.append(d)
      n = n / d
    d += 1
  return factors

def calc(cons, dist):
  m = 9223372036854775807
  currentCons = 0
  for i in xrange(1, m):
    arr = list(set(prime_factors(i)))
    if len(arr) == dist:
      currentCons += 1
      if currentCons == cons:
        return i - (cons - 1)
    else:
      currentCons = 0
  return "$cons consecutive numbers was not found with $dist distinctive factors."

calc(cons, dist)
