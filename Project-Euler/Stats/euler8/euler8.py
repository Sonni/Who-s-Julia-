import sys

path = sys.argv[1]
file = open(path, "r")
str = file.readline()

def adja(str):
	i = 0
	currentProd = 1
	maxProd = 0
	while i < len(str)-12:
		for j in xrange(0, 13):
			currentProd = currentProd * int(str[i+j])
		if currentProd > maxProd:
			maxProd = currentProd
		currentProd = 1
		i += 1
	return maxProd

print adja(str)
close(file)
