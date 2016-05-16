<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 54d8173b8f6c055ce935cdf939b81b1f66982d2b
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
<<<<<<< HEAD


def calc(x, y):
    temp = 0
    total = 0
    for i in range(2, x):
        k = digs(i)
=======
=======
>>>>>>> 54d8173b8f6c055ce935cdf939b81b1f66982d2b


def calc(x, y):
    temp = 0
    total = 0
    for i in range(2, x):
<<<<<<< HEAD
        k = digits(i)
>>>>>>> 130f8de489420bf0455b3d534163bdb39bc221e2
=======
        k = digs(i)
>>>>>>> 54d8173b8f6c055ce935cdf939b81b1f66982d2b
        temp = i
        sum = 0
        for j in k:
            sum += pow(j, y)
<<<<<<< HEAD
<<<<<<< HEAD
        if sum == temp:
            total += sum
    return total

number = int(argv[1])
powers = int(argv[2])
print calc(number, powers)
=======

=======
>>>>>>> 54d8173b8f6c055ce935cdf939b81b1f66982d2b
        if sum == temp:
            total += sum
    return total

<<<<<<< HEAD
interval(1000000, 4)
>>>>>>> 130f8de489420bf0455b3d534163bdb39bc221e2
=======
number = int(argv[1])
powers = int(argv[2])
print calc(number, powers)
>>>>>>> 54d8173b8f6c055ce935cdf939b81b1f66982d2b
