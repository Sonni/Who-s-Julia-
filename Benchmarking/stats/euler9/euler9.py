import sys
import math

number = int(sys.argv[1])
def pytha(number):
	dicto = {}
	for a in range(1, int(math.floor(number/3))):
		for b in range(a + 1, int(math.floor(number / 2))):
			c = number - a - b
			if a * a + b * b == c * c:
				dicto["a"] = a
				dicto["b"] = b
				dicto["c"] = c
	x = dicto["a"] * dicto["b"] * dicto["c"]
	return int(x)
	
pytha(number)
