#=
It is possible to write ten as the sum of primes in exactly five different ways:

7 + 3
5 + 5
5 + 3 + 2
3 + 3 + 2 + 2
2 + 2 + 2 + 2 + 2

What is the first value which can be written as the sum of primes in over five thousand different ways?
=#
#Answer: 71

#Terminal: Julia euler77.jl 5000 1000000

ways = parse(Int, ARGS[1])
limit = parse(Int, ARGS[2])

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
	return primeArray
end

function calc(ways, limit)
  primes = getPrimes(limit)
  target = 2
  while true
    way = zeros(Int, target + 1)
    way[1] = 1

    for i = 1 : length(primes)
      for j = primes[i] : target
        way[j + 1] += way[j + 1 - primes[i]]
      end
    end
    if way[target] > ways
      return target - 1
    end
    target += 1
  end
end

println(calc(ways, limit))