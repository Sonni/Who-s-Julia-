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

#Terminal: julia euler77.jl 5000

ways = parse(Int, ARGS[1])

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

function calc(ways)
	i = 2
	while true
	  arr = zeros(Int64, i)
	  arr[1] = 1
	  primes = getPrimes(i)

	  for p in primes
			#For 0-indexing remove +1
	    for j = p + 1 : length(arr)
	      arr[j] += arr[j - p]
	    end
	  end
	  if arr[i] > ways
			#For 0-indexing remove -1
	    return i - 1 #-1 since +1 is added in j = p + 1
	    break
	  end
	  i += 1
	end
end

println(calc(ways))
