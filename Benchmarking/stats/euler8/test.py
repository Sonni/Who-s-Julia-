import sys

path = sys.argv[1]

def adja(stri):
	i = 0
	currentProd = 1
	maxProd = 0
	while i < len(stri)-13:
        temp = [int(c) for c in stri[i:i+12]]
		for j in range(0, 13):
			currentProd = currentProd * temp[i+j]
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
