#=
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
=#
#Answer: 55

#Terminal: Julia Euler35.jl 1000000

#NOTE NOT WORKING

limit = parse(Int, ARGS[1])
function getPrimes(size)
	array = bitrand(size)
	for i = 2 : size
		array[i] = true
	end
	c = 1
	for i = 2 : size
		if array[i] == true
			j = i + i
			while j < size
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
	return primeArray
end

function calc(limit)
  count = 0

  primes = getPrimes(limit)

  #if primes(2) must be first iteration
  #if primes(parse(Int, num[i:end]) + parse(Int, num[1:i])) #first time = 4
  for num = 2 : limit
    q = false
    num = string(num)
    for i = 1 : length(num)
      if primes(parse(Int, string(num[i:end], num[1:i]))) #first time = 22
        q = true
      else
        q = false
        break
      end
    end
    if q
      count += 1
    end
  end
  return count
end

println(calc(limit))









