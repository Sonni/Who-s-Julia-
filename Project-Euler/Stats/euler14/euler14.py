import sys

limit = int(sys.argv[1])
def seq(n):
  max = 0
  maxNumber = 0
  for i in range(1, n+1):
    countSeq = 1
    temp = i
    current = i
    while current != 1:
      if current % 2 == 0:
        current = current / 2
        countSeq += 1
      else:
        current = 3 * current + 1
        countSeq += 1
    if countSeq > max:
      max = countSeq
      maxNumber = temp
  return maxNumber

print seq(limit)
