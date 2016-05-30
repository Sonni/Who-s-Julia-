import sys

divisors = int(sys.argv[1])

def prime_factors(n):
  factors = []
  d = 2
  while n > 1:
    while n % d == 0:
      factors.append(d)
      n = n / d
    d += 1
  return factors

def calc(div):
  limit = 2147483647
  i = 0
  for n in xrange(1, limit + 1):
    i += n
    countDiv = 1
    fact = prime_factors(i)
    distinct = list(set(fact)) #removes duplicating numbers
    countExp = []
    dic = {}

    for num in distinct:
      for j in xrange(0, len(fact)):
        if num == fact[j]:
          if num in dic:
            dic[num] = dic.get(num, 0) + 1
          else:
            dic[num] = 1

    for k in dic.keys():
      countDiv *= (dic.get(k, 0) + 1)
    if countDiv > div:
      return i

calc(divisors)
