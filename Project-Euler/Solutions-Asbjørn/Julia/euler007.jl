println("What is the 10001st prime number?")

function difsumsqr(x::Int, y::Int)
	array = bitrand(y)
	for i = 1 : y
		array[i] = true
	end
	c = 1
	for i = 2 : y
		if array[i] == true
			if c == x
				return i
			end
			j=i+i
			while j<y
				array[j] = false
				j+=i
			end
			c+=1
		end
	end
end
#@time println(primes(999999)[10001])
@time df = difsumsqr(10001, 999999)
println(df)
