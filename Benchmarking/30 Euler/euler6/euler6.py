import sys

def diffe(n):
	sumDigitsSquare = 0
	sumNumberSquare = 0
	temp = 0
	for i in range(1, n+1):
		sumDigitsSquare += i**2
	for j in range(1, n+1):
		temp += j
	sumNumberSquare = temp**2
	res = sumNumberSquare - sumDigitsSquare
	if res < 0:
		return res * -2
	else:
		return res
	
limit = int(sys.argv[1])
diffe(limit)
