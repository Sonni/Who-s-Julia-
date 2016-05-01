function input(prompt)
   print(prompt)
   return readline()
end

b = false
while !b
	try
		global f = int(input("Find sum of all even fibonacci numbers below: "))
		b = true
	catch
		println("Either the number is too large or it isn't an integer")
	end
end

@time df = factor(f)
println(df)
