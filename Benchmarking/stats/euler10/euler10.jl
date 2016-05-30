#=
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
=#
#Answer: 142913828922

#Terminal: julia euler10.jl 2000000
limit = parse(Int64, ARGS[1])
#Sieve of Eratosthenes
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
sum(getPrimes(limit))
