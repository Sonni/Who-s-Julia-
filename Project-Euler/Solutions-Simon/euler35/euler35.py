import math

def sieve(limit):
    primes = [True] * limit
    primes[0] = primes[1] = False
    for i in range(2, int(math.floor(math.sqrt(limit)))):
        if primes[i]:
            for j in range(i*i, limit, i):
                primes[j] = False
    return primes

def main():
    """Main function"""
    print("Hello, world!")
    limit = 1000000
    count = 0

    primes = sieve(limit)
    for num in range (2, limit):
        q = False
        num = str(num)
        for i in range(len(num)):
            if primes[int(num[i:]+num[:i])]:
                q = True
            else:
                q = False
                break
        if q:
            count += 1
    print (count)

if __name__ == "__main__":
    main()