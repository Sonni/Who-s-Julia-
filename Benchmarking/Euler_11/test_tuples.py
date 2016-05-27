import numpy as np

def a():
  import sys
  maxProd = 0
  matLength = int(sys.argv[1])
  numProd = int(sys.argv[2])
  string = "mat%d.txt" % matLength
  mat = ((((0,) * matLength),) * matLength)
  result = 0
  with open(string) as f:
    j = 0
    for line in f:
      s = line.split()
      for i in xrange(0, len(s)):
        mat = mat[0:j] + (mat[j][0:i] + (int(s[i]),) + mat[j][i+1:],) + mat[j+1:]
      j += 1
    f.close()
  for i in xrange(matLength):
    for j in xrange(matLength - numProd):
      #right/left
      prod = 1
      for k in xrange(0, numProd):
        prod = prod * mat[i][j+k]
      if prod > maxProd:
        maxProd = prod
      #up/down
      prod = 1
      for k in xrange(0, numProd):
        prod = prod * mat[j+k][i]
      if prod > maxProd:
        maxProd = prod

  #diagonal left->right
  for i in xrange(matLength - numProd):
    for j in xrange(matLength - numProd):
      prod = 1
      for k in xrange(0, numProd):
        prod = prod * mat[i + k][j + k]
      if prod > maxProd:
        maxProd = prod

  #diagonal right->left
  for i in xrange(numProd-1, matLength):
    for j in xrange(matLength-numProd):
      prod = 1
      for k in xrange(0, numProd):
        prod = prod * mat[i - k][j + k]
      if prod > maxProd:
        maxProd = prod

  print(maxProd)
a()
