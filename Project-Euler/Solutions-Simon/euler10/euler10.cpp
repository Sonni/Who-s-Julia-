//
//  main.cpp
//  Euler10
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

/*bool isPrime(unsigned int x)
{
    unsigned int divisor = 2;
    bool prime = true;
    while (divisor < x)
    {
        if (x % divisor == 0)
        {
            prime = false;
            break;
        }
        divisor++;
    }
    return prime;
}

unsigned int sumPrime(unsigned n)
{
    unsigned int sum = 0;
    for (unsigned int i = 2; i <= n; i++)
    {
        if (isPrime(i))
        {
            sum += 1;
        }
    }
    return sum;
}*/

unsigned long getPrimeSum(unsigned int size)
{
    bool array[size];
    for (unsigned int i = 0; i <= size; i++)
        array[i] = true;

        array[1] = false;
    unsigned int c = 1;
    for (unsigned int i = 2; i <= size; i++)
    {
        if (array[i])
        {
            unsigned int j = i + i;
            while (j < size)
            {
                array[j] = false;
                j += i;
            }
            c += 1;
        }
    }

    unsigned long sum = 0;
    for (unsigned int i = 2; i < size; i++)
        if (array[i])
            sum += i;

    return sum;
}

int main(int argc, const char * argv[]) {
    std::cout << getPrimeSum(atoi(argv[1])) << std::endl;
    return 0;
}
