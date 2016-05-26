import sys

limit = int(sys.argv[1])

def bouncy(number):
  inc = False
  dec = False

  last = number % 10
  number = number / 10

  while number > 0:
    next = number % 10
    number = number / 10

    if next < last:
      inc = True
    elif next > last:
      dec = True
      
    last = next

    if dec and inc:
      return True
  return dec and inc

def calc(limit):
  i = 99
  bouncies = 0

  while 100 * bouncies < 99 * i:
    i += 1
    if bouncy(i):
      bouncies += 1
  return i

calc(limit)
