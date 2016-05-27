import sys
import numpy as np
from numpy import matrix
from numpy import matlib

def a():
  maxProd = 0
  matLength = int(sys.argv[1])
  numProd = int(sys.argv[2])
  string = "mat%d.txt" % matLength
  mat = np.matlib.zeros((matLength, matLength))

  result = 0
  with open(string) as f:
    j = 0
    h = 0
    for line in f:
      s = line.split()
      for i in xrange(0, len(s)):
        mat.itemset((j, i), int(s[i]))
      j += 1
    f.close()
  for i in xrange(matLength):
    for j in xrange(matLength - numProd):
      #right/left
      prod = 1
      for k in xrange(0, numProd):
        prod = prod * mat.item(i, j + k)
      if prod > maxProd:
        maxProd = prod
      #up/down
      prod = 1
      for k in xrange(0, numProd):
        prod = prod * mat.item(j + k, i)
      if prod > maxProd:
        maxProd = prod

  #diagonal left->right
  for i in xrange(matLength - numProd):
    for j in xrange(matLength - numProd):
      prod = 1
      for k in xrange(0, numProd):
        prod = prod * mat.item(i + k, j + k)
      if prod > maxProd:
        maxProd = prod

  #diagonal right->left
  for i in xrange(numProd-1, matLength):
    for j in xrange(matLength-numProd):
      prod = 1
      for k in xrange(0, numProd):
        prod = prod * mat.item(i - 1, j + k)
      if prod > maxProd:
        maxProd = prod

  print(maxProd)
a()
