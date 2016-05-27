import sys

def f1(n):
	sum = 0
	for i in xrange(1, n):
		if i % 3 == 0 or i % 5 == 0:
			sum += i
	return sum

print f1(int(sys.argv[1]))

