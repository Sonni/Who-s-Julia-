def divisible():
	evenlyDivis = True
	n = 0
	for x in xrange(21, 500000000):
		evenlyDivis = True
		if x == 500000000:
			print "Done"
		for i in range(2, 20):
			n = x % i
			if not(n == 0):
				evenlyDivis = False
				break
		if evenlyDivis:
			print "%d is evenly divisible" % x

divisible()
