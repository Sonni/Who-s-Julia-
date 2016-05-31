import sys

def fibo(n):
	array = [1, 1]
	i = 2
	go = True
	s = 0
	while go:
		x = array[i-2] + array[i-1]
		if x < n:
			array.append(x)
			i += 1
			if x % 2 == 0:
				s += x
		else:
			go = False
			
	return s

fibo(int(sys.argv[1]))
