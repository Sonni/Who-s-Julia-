import sys

limit = int(sys.argv[1])

def isPalindrome(s):
  s = str(s)
  i = 0
  j = len(s) - 1
  isPal = True
  while i <= j - 1:
    if s[i] == s[j]:
      i += 1
      j -= 1
    else:
      isPal = False
      return isPal
  return isPal

def binary(n):
  bina = []
  while n > 0:
    if n % 2 == 0:
      bina.append(0)
    else:
      bina.append(1)
    n = n / 2
  s = ""
  for i in bina:
    s = str(i) + s
  return s


def calc(limit):
  sum = 0
  for i in xrange(1, limit + 1):
    b = binary(i)
    if isPalindrome(i) and isPalindrome(b):
      print i, b
      sum += i
  return sum

calc(limit)
