import sys

num = int(sys.argv[1])
power = int(sys.argv[2])

arrSize = int((power / 10) * 4)
arr = [0 for i in xrange(arrSize)]
arr[0] = num

def calc(arr):
  sum = 0
  carry = 0
  for i in xrange(1, power):
    for j in xrange(0, len(arr)):
      temp = arr[j] * 2
      if temp > 9:
        arr[j] = temp % 10 + carry
        carry = 1
      else:
        arr[j] = temp + carry
        carry = 0

  for i in xrange(0, len(arr)):
    sum += arr[i]
  return sum

print calc(arr)






























