import sys
import numpy as np

def a():
  maxProd = 0
  matLength = int(sys.argv[1])
  numProd = int(sys.argv[2])
  string = "mat%d.txt" % matLength
  mat = np.full((matLength, matLength), 0, dtype=np.int)

  result = 0
  with open(string) as f:
    j = 0
    for line in f:
      s = line.split()
      for i in xrange(0, len(s)):
        mat[j][i] = int(s[i])
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
