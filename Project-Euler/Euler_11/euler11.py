def a():

  maxProd = 0
  matLength = 20
  numProd = 4

  mat = [[0 for i in xrange(matLength)] for i in xrange(matLength)]

  result = 0
  with open("mat20.txt") as f:
    j = 0
    for line in f:
      s = line.split()
      for i in range(0, len(s)):
        mat[j][i] = int(s[i])
      j += 1
    f.close()
  for i in range(matLength):
    for j in range(matLength - numProd):
      #right/left
      prod = mat[i][j] * mat[i][j + 1] * mat[i][j + 2] * mat[i][j + 3]
      if prod > maxProd:
        maxProd = prod
      #up/down
      prod = mat[j][i] * mat[j + 1][i] * mat[j + 2][i] * mat[j + 3][i]
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

  print(maxProd)
a()
