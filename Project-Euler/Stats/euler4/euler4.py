import sys
import math

min = int(sys.argv[1])
max = int(sys.argv[2])
def digitsInArray(n):
	arr = []
	while n > 0:
		d = math.floor(n / 10)
		k = n - d * 10
		n = d
		arr.append(k)
	b = list(reversed(arr))
	return b

def isPalindrome(array):
	i = 0
	j = len(array)-1
	isPal = True
	while i <= j:
		if array[i] == array[j]:
			i += 1
			j -= 1
		else:
			isPal = False
			return isPal
	return isPal

def checkNumber(min, max):
	maxNum = 0
	found = False
	cycleDone = False
	while not(found):
		for x in range(max, min, -1):
			for y in range(max, min, -1):
				k = x * y
				result = isPalindrome(digitsInArray(k))
				if result:
					if k > maxNum:
						maxNum = k
						found = True
		cycleDone = True
		if cycleDone and not(found):
			break
	return maxNum
	
print checkNumber(min, max)
