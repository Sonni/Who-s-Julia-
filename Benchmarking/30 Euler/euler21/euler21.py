import sys

limit = int(sys.argv[1])
def sum_divisors(n):
  sum = 0
  k = n-1
  for i in range(1, k+1):
    if n % i == 0:
      sum += i
  return sum

def amica(a):
  amicable = 0
  sum = 0
  for i in range(1, a+1):
    b = sum_divisors(i)
    c = sum_divisors(b)
    if i == c and i != b:
      amicable += 1
      sum += i
  return sum

print amica(limit)
