#=
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
=#
#Answer: 55

#Terminal: julia Euler35.jl 1000000

limit = parse(Int, ARGS[1])

function getPrimes(size)
  array = fill(true, size)
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

function calc(limit)
  count = 0
  primes = getPrimes(limit)

  for num = 2 : limit
    q = false
    num = string(num)
    for i = 1 : length(num)
      index = parse(Int, string(string(num)[i:end], string(num)[1:i-1]))
      if primes[index]
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
#println(getPrimes(1000))









