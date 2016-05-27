import sys

limit = int(sys.argv[1])

def createPalindrome(input, base, isOdd):
  n = input
  palin = input
  if isOdd:
    n = n / base
  while n > 0:
    palin = palin * base + (n % base)
    n = n / base
  return palin

def isPalindrome(number, base):
  reversed = 0
  k = number
  while k > 0:
    reversed  = base * reversed + (k % base)
    k = k / base
  if number == reversed:
    return True
  else:
    return False

def calc(limit):
  result = 0
  for j in range(1, 3):
    if j % 2 == 0:
      isOdd = False
    else:
      isOdd = True
    i = 1
    while True:
      number = createPalindrome(i, 10, isOdd)
      if number >= limit:
      	break
      if isPalindrome(number, 2):
        result += number
      i += 1
  return result

print calc(limit)
