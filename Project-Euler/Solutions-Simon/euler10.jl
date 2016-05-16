#=
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
=#

function isPrime(x)
  divisor = 2
  prime = true
  while divisor < x
    if x % divisor == 0
      #@printf "%d mod %d == 0\n" x divisor
      prime = false
      break
    end
    divisor += 1
  end
  return prime
end
println(isPrime(7))

function sumPrime(n)
  sum = 0
  for i=2:n
    if isPrime(i)
      sum += i
      println(i)
    end
  end
  return sum
end
println(sumPrime(2_000_000))
#test primes()
#Sieve of Eratosthenes
