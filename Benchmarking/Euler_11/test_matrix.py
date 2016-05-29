import sys
import numpy as np
from numpy import matrix
from numpy import matlib
import time
from time import clock

matLength = int(sys.argv[1])
numProd = int(sys.argv[2])

def makeData(matLength):
    string = "mat%d.txt" % matLength
    mat = np.matlib.zeros((matLength, matLength))

    with open(string) as f:
      j = 0
      for line in f:
        s = line.split()
        for i in xrange(0, len(s)):
          mat.itemset((j, i), int(s[i]))
        j += 1
      f.close()
    return mat

def a(mat, matLength, numProd):
  maxProd = 0

  for i in xrange(matLength):
    for j in xrange(matLength - numProd):
      #right/left
      prod = 1
      for k in xrange(0, numProd):
        prod = prod * int(mat.item(i, j + k))
      if prod > maxProd:
        maxProd = prod
      #up/down
      prod = 1
      for k in xrange(0, numProd):
        prod = prod * int(mat.item(j + k, i))
      if prod > maxProd:
        maxProd = prod

  #diagonal left->right
  for i in xrange(matLength - numProd):
    for j in xrange(matLength - numProd):
      prod = 1
      for k in xrange(0, numProd):
        prod = prod * int(mat.item(i + k, j + k))
      if prod > maxProd:
        maxProd = prod

  #diagonal right->left
  for i in xrange(numProd-1, matLength):
    for j in xrange(matLength-numProd):
      prod = 1
      for k in xrange(0, numProd):
        prod = prod * int(mat.item(i - k, j + k))
      if prod > maxProd:
        maxProd = prod

  return maxProd
startData = time.clock()
data = makeData(matLength)
endData = time.clock() - startData
print endData
startCalc = time.clock()
a(data, matLength, numProd)
endCalc = time.clock() - startCalc
print endCalc
