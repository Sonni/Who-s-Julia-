import sys
import time
from time import clock
matLength = int(sys.argv[1])
numProd = int(sys.argv[2])

def makeData(matLength):
    string = "mat%d.txt" % matLength
    mat = [[0 for i in xrange(matLength)] for i in xrange(matLength)]

    with open(string) as f:
      j = 0
      for line in f:
        s = line.split()
        for i in range(0, len(s)):
          mat[j][i] = int(s[i])
        j += 1
      f.close()
    return mat

def a(mat, matLength, numProd):
  maxProd = 0

  for i in range(matLength):
    for j in range(matLength - numProd):
      #right/left
      prod = 1
      for k in range(0, numProd):
        prod = prod * mat[i][j+k]
      if prod > maxProd:
        maxProd = prod
      #up/down
      prod = 1
      for k in range(0, numProd):
        prod = prod * mat[j+k][i]
      if prod > maxProd:
        maxProd = prod

  #diagonal left->right
  for i in range(matLength - numProd):
    for j in range(matLength - numProd):
      prod = 1
      for k in range(0, numProd):
        prod = prod * mat[i + k][j + k]
      if prod > maxProd:
        maxProd = prod

  #diagonal right->left
  for i in range(numProd-1, matLength):
    for j in range(matLength-numProd):
      prod = 1
      for k in range(0, numProd):
        prod = prod * mat[i - k][j + k]
      if prod > maxProd:
        maxProd = prod

  return maxProd
#startData = time.clock()
data = makeData(matLength)
#endData = time.clock() - startData
#print endData
#startCalc = time.clock()

#a(data, matLength, numProd)

#endCalc = time.clock() - startCalc
#print endCalc