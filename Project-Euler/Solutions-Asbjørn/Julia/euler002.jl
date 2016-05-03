function findSum(k)
	s::BigInt = 0
	n1::BigInt = 1
	n2::BigInt = 1
	while n1 < k
		n1 = n1 + n2
		n2 = n1 - n2
		if mod(n1, 2) == 0
			s+=n1
		end
	end
	println(string("last fibonacci: ", n1, " Sum: ", s))
end

@time findSum(4000000)
