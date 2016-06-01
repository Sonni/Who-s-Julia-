import sys

num = int(sys.argv[1])
def sum_digits(l):
  sum = 0
  for i in str(l):
    sum += int(i)
  return sum

def fact(n):
  res = 1
  for i in range(n, 0, -1):
    res = res * i
  return res
  
sum_digits(fact(num))










