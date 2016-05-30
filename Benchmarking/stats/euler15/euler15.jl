#=
Starting in the top left corner of a 2×2 grid, and only being able to move to
the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20×20 grid?
=#
#Answer: 137846528820

#Terminal: julia euler15.jl 20
siz = parse(Int, ARGS[1])

function calc(siz)
  mat = ones(UInt128, siz + 1, siz + 1)

  for j = siz : -1 : 1
    for i = siz : -1 : 1
      mat[i, j] = mat[i, j + 1] + mat[i + 1, j]
    end
  end
  return mat[1][1]
end

println(calc(siz))
