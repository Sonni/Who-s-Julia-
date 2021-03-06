import sys

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

file = open(sys.argv[1], "r")
str = file.readline()
a = str.split()
data = []
for i in range(0, len(a)-1):
	data.append(int(a[i]))

file.close()

jumpLength = 125
i = 0
shouldBreak = 0

while 1==1:
    i += jumpLength
    if i > len(data) - 1:
        i = len(data) - 1
        shouldBreak = 1
    quicksortDualPivot(data, 0, i)
    if shouldBreak == 1:
        break