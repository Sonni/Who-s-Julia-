#=
  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475143.
=#
#Answer: 6857

#Terminal: Julia euler3.jl 600851475143
limit = parse(Int, ARGS[1])
function prime_factors(n)
  factors = Int[]
  d = 2
  while n > 1
    while n % d == 0
      push!(factors, d)
      n /= d
    end
    d += 1
  end
  return factors[end]
end

prime_factors(limit)
