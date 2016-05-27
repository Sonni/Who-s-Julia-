import sys

limit = int(sys.argv[1])

def calc(limit):
  num = 0
  for i in range(5, limit+1):
    x1 = sorted(list(str(i)))
    x2 = sorted(list(str(i * 2)))
    x3 = sorted(list(str(i * 3)))
    x4 = sorted(list(str(i * 4)))
    x5 = sorted(list(str(i * 5)))
    x6 = sorted(list(str(i * 6)))
    sameDigits = False
    if x1 == x2 and x2 == x3 and x3 == x4 and x4 == x5 and x5 == x6:
      sameDigits = True
      num = i
  return num

print calc(limit)
