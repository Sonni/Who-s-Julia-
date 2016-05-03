println("Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.")

function find(amount)
	abun = Int[]
	for i = 0 : amount-1
		n = float(i) #945
		arr = Int[]
		nh = div(n, 2)
		for j in nh:-1:0
			if mod(n, j) == 0
				push!(arr, j)
			end
		end
		if sum(arr) > n
			push!(abun, i)
		end
	end
	println(abun)
	
	tmp = collect(0:amount-1)
	for i in abun
		for j in abun
			#println(string("i ", i, " j ",j))
			if i + j < amount
				tmp[i + j + 1]=0
			else
				break
			end
		end
	end
	#println(sort(twoAbun))
	
	return tmp
end

@time s=find(28123) #958
#println(s)
println(sum(s))

#Redundant
function isPerfect(m::Int)
	arr = Int[]
	for i in div(m, 2):-1:0
		if mod(m, float(i)) == 0
			push!(arr, i)
		end
	end
	return sum(arr) == m
end
