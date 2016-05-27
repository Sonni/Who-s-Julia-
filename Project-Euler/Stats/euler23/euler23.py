import sys
import math

def sum_divisors(n):
  sum = 1
  limit = int(math.floor(n * 0.5) + 1)
  for i in range(2, limit):
    if n % i == 0:
      sum += i
  return sum

def is_abundant(n):
  if sum_divisors(n) > n:
    return True
  else:
    return False

def find_abundants(limit):
  abundants = []
  for i in range(1,limit+1):
    if is_abundant(i):
      abundants.append(i)
  return abundants

def get_list(limit):
  abds = find_abundants(limit)
  list = [i for i in range(1, limit)]
  for x in abds:
    for y in abds:
      if x + y >= limit:
        break
      list[x+y-1] = 0
  return list

print(sum(get_list(28123)))
