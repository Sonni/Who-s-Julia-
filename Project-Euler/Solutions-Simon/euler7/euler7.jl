#=
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
=#
#Answer = 104_743

#Terminal: Julia euler7.jl 10001
primeNumber = parse(Int, ARGS[1])
function isPrime(x)
  divisor = 2
  prime = true
  while divisor < x
    if x % divisor == 0
      prime = false
      break
    end
    divisor += 1
  end
  return prime
end

function findPrime(primeNumber)
  counter = 0 #Counting primes
  number = 2 #Start from 2 since 1 is not a prime.
  while counter < primeNumber
    if isPrime(number)
      counter += 1
      if counter == primeNumber
        break
      end
    end
    number += 1
  end
  if counter == primeNumber
    return number
  end
end

println(findPrime(primeNumber))
