println("Find the sum of all the primes below two million.")

println("What is the 10001st prime number?")

function getPrimes(size::Int)
	array = bitrand(size)
	for i = 1 : size
		array[i] = true
	end
	c = 1
	for i = 2 : size
		if array[i] == true
			j=i+i
			while j<size
				array[j] = false
				j+=i
			end
			c+=1
		end
	end
	primeArray = Int[]
	for i = 1 : size
		if(array[i])
			push!(primeArray, i)
		end
	end
	return primeArray
end
#@time println(sum(primes(2000000)))
@time df = getPrimes(2000000)
println(sum(df))
