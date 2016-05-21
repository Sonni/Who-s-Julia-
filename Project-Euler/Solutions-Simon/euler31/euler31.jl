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

coinSizes = Int[1, 2, 5, 10, 20, 50, 100, 200]
ways = zeros(Int, target+4)
ways[1] = 1

#Something is messing with the index
for i = 1 : length(coinSizes)
  for j = coinSizes[i] : target
    println("j:$j")
    println("i:$i")
    if j != 1
      ways[j] += ways[j - coinSizes[i]]
    else
      ways[j] += ways[j]
    end
  end
end

println(ways)
