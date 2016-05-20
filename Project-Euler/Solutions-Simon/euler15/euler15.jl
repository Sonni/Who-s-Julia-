#=
Starting in the top left corner of a 2×2 grid, and only being able to move
to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20×20 grid?
=#
#Answer: 137846528820

#Terminal: Julia euler15.jl 20
gridSize = parse(Int, ARGS[1])
#Fill matrix with 1 of size gridSize + 1
grid = ones(BigInt, gridSize+1, gridSize+1)

function calc(grid, gridSize)
  for i = gridSize : -1 : 1
    for j = gridSize : -1 : 1
      grid[i, j] = grid[i+1, j] + grid[i, j+1]
    end
  end
  return grid[1, 1]
end

println(calc(grid, gridSize))