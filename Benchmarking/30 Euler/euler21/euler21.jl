#=

Let d(n) be defined as the sum of proper divisors of n (numbers less than
n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71
and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
=#
#Answer: 31626

#Terminal: Julia euler21.jl 10000
limit = parse(Int, ARGS[1])
function sum_divisors(n)
  sum = 0
  k = n-1
  for i in range(1, k)
    if n % i == 0
      sum += i
    end
  end
  return sum
end

function amica(a)
  amicable = 0
  sum = 0
  for i=1:a
    b = sum_divisors(i)
    c = sum_divisors(b)
    if i == c && i != b
      amicable += 1
      sum += i
    end
  end
  return sum
end

amica(limit)
