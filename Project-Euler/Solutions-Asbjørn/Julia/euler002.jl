function input(prompt)
   print(prompt)
   return readline()
end

function findSum()
	s::Uint128 = 0
	n1::Uint128 = 1
	n2::Uint128 = 1
	for i=1:f
		if(n2<n1)
			println()
			print("Overflow at: ")
			print(i)
			println()
			break
		end
		if mod(n2,2)==0
			s+=n2
		end
		tmp = n2
		n2 = n1 + tmp
		n1 = tmp
	end
	println()
	print("last fibonacci: ")
	print(n1)
	println()
	print("Sum: ")
	print(s)
	println()
end

b = false
while !b
	try
	global f = integer(input("Find sum of all even fibonacci numbers below: "))
	if(f>185)
		println("Error: The result will be too big for a 128bit unsigned integer")
		println("Please choose a number below 186")
	else
		b = true
	end
	end
end

@time findSum()
