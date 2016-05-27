//
//  main.cpp
//  euler50
//
//  Created by Sonni on 23/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

std::vector<bool> getPrimes(unsigned int size)
{
    std::vector<bool> array;
    for (unsigned int i = 1; i <= size; i++)
        array.push_back(true);
    array[0] = false;
    for (unsigned int i = 2; i <= size; i++)
    {
        if (array[i])
        {
            unsigned int j = i + i;
            while (j <= size)
            {
                array[j] = false;
                j += i;
            }
        }
    }
    return array;
}

unsigned int calc(unsigned int limit)
{
    std::vector<bool> primes = getPrimes(limit);
    
    unsigned int maxSeq = 0;
    unsigned int maxPrime = 0;
    for (unsigned int i = 1; i < limit; i++)
    {
        unsigned int sum = 0;
        unsigned int seq = 0;
        for (unsigned int j = i; j < limit; j++)
        {
            if (primes[j])
            {
                sum += j;
                seq += 1;
                if (sum > limit)
                    break;
            
                if (primes[sum])
                {
                    if (seq > maxSeq)
                    {
                        maxSeq = seq;
                        maxPrime = sum;
                    }
                }
            }
        }
    }
    return maxPrime;
}

int main(int argc, const char * argv[]) {
    std::cout << calc(atoi(argv[1])) << std::endl;;
    return 0;
}
