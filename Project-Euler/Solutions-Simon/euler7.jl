#=
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
=#
#Answer = 104_743

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
#println(isPrime(7))

function findPrime()
  arrayPrimes = Int64[]
  counter = 0
  number = 2
  primeNumber = 10001
  while counter < primeNumber
    if isPrime(number)
      counter += 1
      #println(number)
      if counter == primeNumber
        break
      end
    end
    number += 1
  end
  push!(arrayPrimes, number)
  #println(size(arrayPrimes))
  println(arrayPrimes[end])
end

findPrime()
