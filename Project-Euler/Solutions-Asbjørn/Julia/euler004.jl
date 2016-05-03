println("Finding the largest palindrome made from the product of two 3-digit numbers.")

function palin()
	n1 = 999
	p = 0
	test = ""
	largest = 0
	for i = n1 : -1 : 0
		for j = n1 : -1 : 0
			p = i * j
			test = reverse(string(p))
			if p == parse(Int, test)
				if(p>largest)
					println(string("Largest found: ", i, " * ", j, " = ", p))
					largest = p
				end
			end
		end
	end
	return largest
end
@time println(palin())
