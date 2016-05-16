#=
A perfect number is a number for which the sum of its proper divisors is
exactly equal to the number. For example, the sum of the proper divisors of 28
would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than
n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
number that can be written as the sum of two abundant numbers is 24.
By mathematical analysis, it can be shown that all integers greater than
28123 can be written as the sum of two abundant numbers.

Find the sum of all the positive integers which cannot be written as the
sum of two abundant numbers.
=#

#Answer = 4_179_871

function sum_divisors(n)
  sum = 1
  limit = Int(floor(n * 0.5) + 1)
  for i=2:limit-1
  #for i in range(2, limit-2)
    if n % i == 0
      sum += i
    end
  end
  return sum
end

function is_abundant(n)
  if sum_divisors(n) > n
    return true
  else
    return false
  end
end

function find_abundants(limit)
  abundants = []
  #for i in range(1, limit)
  for i = 1:limit
    if is_abundant(i)
      push!(abundants, i)
    end
  end
  return abundants
end

function get_list(limit)
  abds = find_abundants(limit)
  println(length(abds))
  list = Array(1:limit-1)
  for x in abds
    for y in abds
      if x + y >= limit
        break
      end
      list[x+y] = 0
    end
  end
  sum = 0
  return list
end

@time print(sum(get_list(28123)))
#print(get_list(28123))
