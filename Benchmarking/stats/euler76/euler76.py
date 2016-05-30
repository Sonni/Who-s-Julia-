import sys

target = int(sys.argv[1])

def calc(target, k):
  if target == 0 or k == 1:
    return 1
  elif target < 0 or k <= 0:
    return 0
  return calc(target,k-1) + calc(target-k,k);

calc(target, target-1)
