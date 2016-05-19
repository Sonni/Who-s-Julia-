def diffe(n):
	sumFirst = 0
	sumSecond = 0
	temp = 0
	for i in range(1, n+1):
		sumFirst += i**2
	for j in range(1, n+1):
		temp += j
	sumSecond = temp**2
	difference = sumSecond - sumFirst
	print "sumFirst: %d" % sumFirst
	print "sumSecond: %d" % sumSecond
	print "Difference: %d" % difference
	
diffe(100)
