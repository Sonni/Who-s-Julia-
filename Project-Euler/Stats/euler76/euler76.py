import sys

target = int(sys.argv[1])

def calc(target):
  ways = [1 for i in xrange(target + 2)]
  for i in xrange(2, target):
    for j in xrange(i, target + 1):
      ways[j + 1] += ways[j + 1 - i]
  return ways[-1]

print calc(target)
