import sys

path = sys.argv[1]

def adja(str):
	i = 0
	currentProd = 1
	maxProd = 0
	while i < len(str)-13:
		for j in range(0, 13):
			currentProd = currentProd * int(str[i+j])
		if currentProd > maxProd:
			maxProd = currentProd
		currentProd = 1
		i += 1
	return maxProd

def calc(path):
	maxi = 0
	with open(path, "r") as f:
		for l in f:
			temp = adja(l)
			if temp > maxi:
				maxi = temp
	f.close()
	return maxi

print calc(path)
