#=
The sum of the squares of the first ten natural numbers is,

1^2 + 2^2 + ... + 10^2 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)^2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
=#

#Answer: 25_164_150
function diffe(n)
  sumFirst = 0
  sumSecond = 0
  temp = 0

  for i=1:n
    sumFirst += i^2
  end
  for j=1:n
    temp += j
  end
  sumSecond = temp^2
  difference = sumSecond - sumFirst
  println("sumFirst: $sumFirst")
  println("sumSecond: $sumSecond")
  println("Difference: $difference")
end

diffe(100)
