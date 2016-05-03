function solutions(m, n)
	s = 0
	c = n
	while c != mod(n, m)
		s += c - m + 1
		println(string(c, " ", s))
		c -= m
	end
	return s
end

function getColours()
	red = solutions(2, 50)
	green = solutions(3, 50)
	blue = solutions(4, 50)
	return red + green + blue
end
 
@time println(solutions(4, 10))
