#=
It is possible to write five as a sum in exactly six different ways:

4 + 1
3 + 2
3 + 1 + 1
2 + 2 + 1
2 + 1 + 1 + 1
1 + 1 + 1 + 1 + 1

How many different ways can one hundred be written as a sum of at least two positive integers?
=#
#Answer:

#Terminal: Julia euler76.jl 100

target = parse(Int, ARGS[1])

function calc(target)
  ways = ones(Int, target + 1)

  for i = 2 : target - 1
    for j = i : target
      ways[j+1] += ways[j+1 - i]
    end
  end
  return ways[end]
end

println(calc(target))