#=
  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475143.
=#
function printsum(a)
    # summary generates a summary of an object
    println(repr(a))
end

function prime_factors(n)
  factors = Int64[]
  d = 2
  while n > 1
    while n % d == 0
      push!(factors, d)
      n /= d
    end
    d += 1
  end
  printsum(factors)
end

prime_factors(600851475143)
