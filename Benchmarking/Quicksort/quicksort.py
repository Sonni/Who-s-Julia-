import sys

def quicksort(a, s, e):
	if s < e:
		pivot = a[e]
		pointer = s
		for i in range(s, e): 
			if a[i] <= pivot:
				swap(a, pointer, i)
				pointer += 1
		swap(a, pointer, e)

		quicksort(a, s, pointer-1)
		quicksort(a, pointer, e)

def quicksortDualPivot(a, s, e):
	if s < e:
		if (a[s] > a[e]):
			swap(a, s, e)

		leftPiv = a[s]
		rightPiv = a[e]

		leftPoi = s + 1
		rightPoi = e - 1

		curEle = leftPoi

		while curEle <= rightPoi:
			if a[curEle] < leftPiv:
				swap(a, curEle, leftPoi)
				leftPoi += 1
	 		elif a[curEle] >= rightPiv:
				while a[rightPoi] > rightPiv and curEle < rightPoi:
					rightPoi -= 1

				swap(a, curEle, rightPoi)
				rightPoi -= 1
				if (a[curEle] < leftPiv):
					swap(a, curEle, leftPoi)
					leftPoi += 1
			curEle += 1
		leftPoi -= 1
		rightPoi += 1

		swap(a, s, leftPoi)
		swap(a, e, rightPoi)

		quicksortDualPivot(a, s, leftPoi - 1)
		quicksortDualPivot(a, leftPoi + 1, rightPoi - 1)
		quicksortDualPivot(a, rightPoi + 1, e)

def swap(a, i, j):
	tmp = a[i]
	a[i] = a[j]
	a[j] = tmp

file = open(sys.argv[2], "r")
str = file.readline()
a = str.split()
data = []
for i in range(0, len(a)-1):
	data.append(int(a[i]))

file.close()
if sys.argv[1] == "dualquicksort":
	quicksortDualPivot(data, 0, len(data)-1)
elif sys.argv[1] == "quicksort":
	quicksort(data, 0, len(data)-1)

#print(data)
