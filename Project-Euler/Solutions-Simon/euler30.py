from sys import argv
def dig(n):
    array = []
    while n > 0:
        d = n / 10
        k = n - d * 10
        n = d
        array.append(k)
    array.reverse()
    return array


def calc(x, y):
    temp = 0
    total = 0
    for i in range(2, x):
        k = digs(i)
        temp = i
        sum = 0
        for j in k:
            sum += pow(j, y)
        if sum == temp:
            total += sum
    return total

number = int(argv[1])
powers = int(argv[2])
print calc(number, powers)
