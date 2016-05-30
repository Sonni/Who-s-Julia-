#=
The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

 1: 1
 3: 1,3
 6: 1,2,3,6
10: 1,2,5,10
15: 1,3,5,15
21: 1,3,7,21
28: 1,2,4,7,14,28
We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred divisors?
=#
#Answer: 76576500

#Terminal: julia euler12.jl 500
divisors = parse(Int, ARGS[1])

function prime_factors(n)
  factors = Int[]
  d = 2
  while n > 1
    while n % d == 0
      push!(factors, d)
      n = div(n, d)
    end
    d += 1
  end
  return factors
end

function calc(div)
  limit = typemax(Int32)
  i = 0
  for n = 1 : limit
    i += n
    countDiv = 1
    fact = prime_factors(i)
    distinct = unique(fact) #removes duplicating numbers
    countExp = Int[]
    dict = Dict{Int32, Int32}()

    for num in distinct
      for j = 1 : length(fact)
        if num == fact[j]
          if haskey(dict, num)
            dict[num] = get(dict, num, 0) + 1
          else
            dict[num] = 1
          end
        end
      end
    end

    for k in keys(dict)
      countDiv *= (get(dict, k, 0) + 1)
    end
    if countDiv > div
      return i
    end
  end
end


println(calc(divisors))
