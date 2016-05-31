#=
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?
=#
#Answer: 134043

#Terminal: julia euler47.jl 4 4
cons = parse(Int, ARGS[1])
dist = parse(Int, ARGS[2])

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
  return factors #array of prime factors of n
end

function calc(cons, dist)
  m = typemax(Int64)
  currentCons = 0
  for i = 1 : m
    arr = unique(prime_factors(i)) #Removes dublicates in the returned array from prime_factors
    if length(arr) == dist
      currentCons += 1
      if currentCons == cons
        return i - (cons - 1)
      end
    else
      currentCons = 0
    end
  end
  return "$cons consecutive numbers was not found with $dist distinctive factors."
end

calc(cons, dist)
