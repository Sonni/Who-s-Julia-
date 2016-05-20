#=
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
=#

function sum_digits(l)
  sum = 0
  for i in string(l)
    sum += parse(Int, i)
  end
  return sum
end

function fact(n)
  return factorial(big(n))
end

println(sum_digits(fact(100)))










