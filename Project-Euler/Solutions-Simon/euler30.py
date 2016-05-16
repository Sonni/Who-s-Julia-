
def digits(x):
    number = x
    return map(int, str(number))


def interval(x, y):
    temp = 0
    total = 0
    for i in range(2, x):
        k = digits(i)
        temp = i
        sum = 0
        for j in k:
            sum += pow(j, y)

        if sum == temp:
            total += sum
    print(total)

interval(1000000, 4)
