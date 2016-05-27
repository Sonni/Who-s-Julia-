import sys

def solve(m, n): #m=color block size  n = black box size
  if m > n:
    return 0
  solutions = 0

  for i in xrange(m, n+1):
    solutions += 1
    solutions += solve(m, n-i)

  return solutions

def s(size, numColors):
  result = 0;
  for i in xrange(0, numColors):
     result += solve(2+i, size)
  return result

size = int(sys.argv[1])
numColors = int(sys.argv[2])

s(size, numColors)
