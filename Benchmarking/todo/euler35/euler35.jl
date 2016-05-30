#=
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
=#
#Answer: 55

#Terminal: julia euler35.jl 1000000
limit = parse(Int, ARGS[1])

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
	primeArray = Int[]
	for i = 2 : size
		if(array[i])
			push!(primeArray, i)
		end
	end
	return primeArray, array
end

function rotate(s) #Rotating n
  first = s[1:1]
  last = s[2:end]
  return string(last, first)
end

function calc(limit)
  #primes = array of primes
  #primesBool = array of booleans, if element is true, the index is a prime.
  #primesBool[11] = true, 11 is prime
  primes, primesBool = getPrimes(limit)

  count = 0 #Amount of circular primes found
  for p in primes
    s = string(p)
    l = length(s)
    circPrime = true
    for i = 1 : l-1
      s = rotate(s)
      n = parse(Int, s)
      if !primesBool[n]
        circPrime = false
        break
      end
    end
    if circPrime
      count += 1
    end
  end
  return count
end
calc(limit)
