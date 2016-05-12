#=
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
=#


function powers(x)
  a = digits(x)
  b = reverse(a)
  #=
  sum = 0
  for i in b
    sum += i^y
    #sum += i*i*i*i*i
  end
  =#
  return b
end
#@time powers(54321)

function interval(x, y)
  temp = 0
  total = 0
  for i = 2 : x
    k = powers(i)
    temp = i
    sum = 0
    for j in k
      sum += j^y
    end
    if sum == temp
      total += sum
    end
  end
  println(total)
end

@time interval(100_000_000, 4)
