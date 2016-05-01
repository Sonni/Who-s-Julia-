println("Finding the largest palindrome made from the product of two 3-digit numbers.")

function palin()
	n1 = 999
	n2 = 999
	p = 0
	test = ""
	while n1 >= 100
		while true
			p = n1 * n2
			test = reverse(string(p))
			if p == integer(test)
				println(string("The numbers are: ", n1, " and ", n2))
				return
			end
			if n2 <= n1-1
				break
			end
			n2 -= 1
		end
		n1 -= 1
	end
end
@time df = palin()
