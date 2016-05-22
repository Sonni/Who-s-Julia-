import sys


target = parse(Int, ARGS[1])

function calc(target)
  ways = ones(Int, target + 2)

  for i = 1 : target - 1
    for j = i : target
      ways[j] += ways[j+1 - i]
    end
  end
  return ways
end

println(calc(target))