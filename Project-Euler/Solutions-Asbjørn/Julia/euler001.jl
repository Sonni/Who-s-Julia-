function input(prompt)
   print(prompt)
   return readline()
end

function findSum()
	print("Sum: ")
	s = 0
	for i=1:f
		n=3*i
		n2=5*i
		if n<f
		s+=n
		end
		m=mod(n2,3)
		if n2<f && m!=0
		s+=n2
		end
	end
	print(s)
	println()
end

b = false
while !b
	try
	global f = integer(input("Find sum of all the multiples of 3 or 5 below: "))
	b = true
	end
end

@time findSum()
