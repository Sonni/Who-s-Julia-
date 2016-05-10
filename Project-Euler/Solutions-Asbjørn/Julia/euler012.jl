println("What is the value of the first triangle number to have over five hundred divisors?")

function rg()
	coll = [BigInt(1)]
	n = sum(coll)
	while true
		arr = Int[]
		nh = BigInt(div(BigFloat(n), 2))
		for i in nh:-1:0
			if mod(BigFloat(n), BigFloat(i)) == 0
				push!(arr, i)
			end
		end
		println(BigFloat(n))
		println(length(arr))
		if length(arr) >= 4
			break
		end
		push!(coll, coll[endof(coll)]+1)
		n = sum(coll)
	end
	return BigInt(n)
end


@time df = rg()
println(df)
