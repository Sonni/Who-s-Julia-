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
#Answer: 190569291

#Terminal: julia euler76.jl 100
target = parse(Int, ARGS[1])

function calc(target, k)
  #k is 1 smaller than target, since target itself does not count as a way
  if target == 0 || k == 1
    return 1;
  elseif target < 0 || k <= 0
    return 0;
  end
  return calc(target,k-1) + calc(target-k,k);
end

println(calc(target, target-1))