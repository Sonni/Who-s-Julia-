import sys

siz = int(sys.argv[1])

def calc(siz):
  mat = [[1 for i in xrange(siz+2)] for j in xrange(siz+2)]

  for j in xrange(siz-1, -1, -1):
    for i in xrange(siz-1, -1, -1):
      mat[i][j] = mat[i][j+1] + mat[i+1][j]
  return mat[0][0]

calc(siz)
