#=
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
=#
#Answer = 104_743

#Terminal: julia euler7.jl 10001 1000000
primeNumber = parse(Int, ARGS[1]) #prime number 10001
limit = parse(Int, ARGS[2]) #get all primes < limit

function getPrimes(size)
	array = fill(true, size)
	array[1] = false
	c = 1
	for i = 2 : size
		if array[i] == true
			j = i + i
			while j <= size
				array[j] = false
				j += i
			end
			c += 1
		end
	end
  return array
end

function calc(primeNumber, limit)
  primes = getPrimes(limit)
  count = 0
  k = 1
  for i = 1 : length(primes)
    if primes[i]
      count += 1
    end
    if count == primeNumber
      return i
    end
  end
end

calc(primeNumber, limit)
