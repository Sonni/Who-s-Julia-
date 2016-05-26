import sys

target = int(sys.argv[1])

def calc(target):
  ways = [1 for i in range(target + 2)]
  for i in range(2, target):
    for j in range(i, target + 1):
      ways[j + 1] += ways[j + 1 - i]
  return ways[-1]

calc(target)
