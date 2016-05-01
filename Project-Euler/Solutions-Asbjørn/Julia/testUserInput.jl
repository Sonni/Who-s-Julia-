function input(prompt)
   print(prompt)
   return readline()
end

b = false
f = 0
while !b
	try
	f = integer(input("Add four to: "))
	b = true
	end
end
println(f + 4)
