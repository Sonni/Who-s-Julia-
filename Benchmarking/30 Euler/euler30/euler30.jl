#=
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
=#
#Answer: 443839

#Terminal: Julia euler30.jl 1000000 5
number = parse(Int, ARGS[1])
power = parse(Int, ARGS[2])

function digs(n)
  arr = []
  while n > 0
      d = round(Int, floor(n / 10))
      k = n - d * 10
      n = d
      push!(arr, k)
  end
  b = reverse(arr)
  return b
end

function calc(x, y)
  temp = 0
  total = 0
  for i = 2 : x
    k = digs(i)
    temp = i
    sum = 0
    for j in k
      sum += j^y
    end
    if sum == temp
      total += sum
    end
  end
  return total
end

calc(number, power)
