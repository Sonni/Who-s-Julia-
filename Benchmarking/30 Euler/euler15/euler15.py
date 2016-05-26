import sys

gridSize = int(sys.argv[1])

grid = [ [ 1 for i in range(gridSize+1) ] for j in range(gridSize+1) ]

def calc(grid, gridSize):
  for i in range(gridSize-1, -1, -1):
    for j in range(gridSize-1, -1, -1):
      grid[i][j] = grid[i+1][j] + grid[i][j+1]
  return grid[0][0]

calc(grid, gridSize)
