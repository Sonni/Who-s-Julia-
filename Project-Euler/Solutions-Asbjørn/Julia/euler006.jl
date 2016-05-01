println("Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.")

function difsumsqr(x::Int)
	n1 = 0
	n2 = 0
	for i = 1 : x
		n1 += i^2
		n2 += i
	end
	n2 = n2^2
	println(string("n1: ", n1, " n2: ", n2))
	println(string("Result: ", n2-n1))
end
@time df = difsumsqr(100)
