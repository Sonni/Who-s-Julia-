import sys

target = int(sys.argv[1])

def calc(target):
  coinSizes = [1, 2, 5, 10, 20, 50, 100, 200]
  ways = [0 for i in range(target+1)]
  ways[0] = 1

  for i in range(0, len(coinSizes)):
    for j in range(coinSizes[i], target+1):
      ways[j] += ways[j - coinSizes[i]]
      
  return ways[-1]

calc(target)
