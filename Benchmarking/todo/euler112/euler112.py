import sys

prop = float(sys.argv[1])

def kind(n):
  s = str(n)
  l = len(s)
  i = 0
  j = i + 1
  decr, bouncy, incr = False, False, False
  while j < l:
    a = int(s[i])
    b = int(s[j])
    if s[i] > s[j]:
      decr = True
    elif s[i] < s[j]:
      incr = True
    i += 1
    j += 1
  if decr and incr:
    return True
  return False

def calc(prop):
  currentProp = 0
  i = 100
  countBouncy = 0
  while currentProp < prop:
    if kind(i):
      countBouncy += 1
    currentProp = (countBouncy * 100) / i
    if currentProp >= prop:
      return i
    i += 1
  return "Proportion was not reached."

print calc(prop)
