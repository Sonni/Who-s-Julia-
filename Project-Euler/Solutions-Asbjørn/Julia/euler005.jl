println("What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?")

function evdiv(x::Int)
	i = x
	while true
		b = true
		for j = 1 : x
			if mod(i,j)!=0
				b = false
				break
			end
		end
		if b
			println(string("Result: ", i))
			break
		end
		i += 1
	end
end
@time df = evdiv(20)
