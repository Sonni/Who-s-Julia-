#=
The sum of the squares of the first ten natural numbers is,

1^2 + 2^2 + ... + 10^2 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)^2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
=#
#Answer: 25_164_150

#Terminal: julia euler6.jl 100
limit = parse(Int, ARGS[1])

function diffe(n)
  sumDigitsSquare = 0
  sumNumberSquare = 0
  temp = 0

  #sum of all i^2 to n^2
  for i=1:n
    sumDigitsSquare += i^2
  end

  #Square of the sum from 1-n
  for j=1:n
    temp += j
  end
  sumNumberSquare = temp^2

  res = sumNumberSquare - sumDigitsSquare
  if res < 0
    return res += res * -2
  else
    return res
  end
end

println(diffe(limit))
