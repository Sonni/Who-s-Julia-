numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
res = []
n = 999999
m = 362880 # 9!
for i in range(9, 0, -1):
    d = n / m
    n = n - d * m
    print d
    print n
    res.append(numbers[d])
    numbers.pop(d)
    m /= i
    print m
res.append(numbers[0])