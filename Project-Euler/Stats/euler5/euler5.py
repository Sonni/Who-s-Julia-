import sys

def divisible(div, limit):
	evenlyDivis = True
	n = 0
	for x in xrange(div+1, limit):
		evenlyDivis = True
		for i in xrange(2, div):
			n = x % i
			if not(n == 0):
				evenlyDivis = False
				break
		if evenlyDivis:
			return x

div = int(sys.argv[1])
limit = int(sys.argv[2])
print divisible(div, limit)
