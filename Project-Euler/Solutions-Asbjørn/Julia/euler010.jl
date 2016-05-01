println("There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.")

function pabc()
	r = 1000
	a = 1
	b = 1
	c = r-a-b
	while true
		if ((a+b+c)==r && (a^2+b^2)==(c^2))
			return [a, b, c]
		end
		if(b>=c-1)
			a += 1
			b = a
			c = r-a-b
		else
			b += 1
			c -= 1
		end
	end
	return -1
end

@time df = pabc()
println(df)
