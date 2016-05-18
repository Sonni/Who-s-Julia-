#=
Starting in the top left corner of a 2×2 grid, and only being able to move
to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20×20 grid?
=#

gridSize = parse(Int, ARGS[1])
grid = ones(BigInt, gridSize+1, gridSize+1)

for i = gridSize : -1 : 1
  for j = gridSize : -1 : 1
    grid[i, j] = grid[i+1, j] + grid[i, j+1]
  end
end

println(grid[1, 1])