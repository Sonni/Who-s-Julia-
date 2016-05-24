import sys

data = sys.argv[1]
def makeData(data):
	row = 0
	mat = [ [ 0 for i in range(50) ] for j in range(100) ]
	with open(data, "r") as f:
		for line in f:
			temp = []
			line = "".join(line.split())
			for ch in line:
				if ch.isdigit():
					temp.append(int(ch))
			col = 0
			for t in temp:
				mat[row][col] = t
				col += 1
			row += 1
	return mat

def calc(mat):
	r = len(mat)
	c = len(mat[0])
	temp = []
	for col in range(c-1, -1, -1):
		s = 0
		for row in range(r-1, -1, -1):
			s += mat[row][col]
		temp.append(s)
	i = 0
	while True:
		if i < c-1:
			k = temp[i] % 10
			n = (temp[i] - k) / 10
			temp[i] = k
			temp[i + 1] = temp[i + 1] + n
		else:
			k = temp[i] % 10
			n = (temp[i] - k) / 10
			temp[i] = k
			temp.append(n)
		if temp[-1] < 10:
			break
		i += 1
	result = ""
	for i in range(0, 10):
		result = result + str(temp[-(1+i)])
	return result

print calc(makeData(data))
