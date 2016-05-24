import sys

file = sys.argv[1]
f = open(file)
lines = sum(1 for line in f)
f.close()
rows = [ [ 0 for i in range(lines+1) ] for j in range(lines+1) ]

with open(file, "r") as f:
  r = 0
  for line in f:
    line = line.split()
    c = 0
    for ch in line:
      if ch.isdigit():
        rows[r][c] = int(ch)
        c += 1
    r += 1

def sum(data, row):
	c = len(data)
	for i in range(0, c-1):
		if(data[row+1][i] > data[row+1][i+1]):
			data[row][i] += data[row+1][i]
		else:
			data[row][i] += data[row+1][i+1]
	if row == 0:
		return data[row][0]
	else:
		return sum(data, row-1)

result = sum(rows, lines-1)
print result
