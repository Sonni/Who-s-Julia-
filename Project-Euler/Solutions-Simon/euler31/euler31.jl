#=
In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:

1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
How many different ways can £2 be made using any number of coins?
=#
#Answer: 73682

#Terminal: Julia euler31.jl 200

target = parse(Int, ARGS[1])

function calc(target)
  coinSizes = Int[1, 2, 5, 10, 20, 50, 100, 200]
  ways = zeros(Int, target + 1)
  ways[1] = 1

  for i = 1 : length(coinSizes)
    for j = coinSizes[i] : target
      println(ways[j+1 - coinSizes[i]])
      ways[j+1] += ways[j+1 - coinSizes[i]]
    end
  end

  return ways[end]
end

println(calc(target))
