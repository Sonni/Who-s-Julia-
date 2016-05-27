//
//  main.cpp
//  Euler7
//
//  Created by Sonni on 19/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

std::vector<bool> getPrimes(unsigned int size)
{
    std::vector<bool> array;
    for(int i = 0; i <= size; i++)
        array.push_back(true);
    
    array[1] = false;
    for(unsigned int i = 2; i <= size; i++)
    {
        if(array[i])
        {
            unsigned int j = i + i;
            while(j <= size)
            {
                array[j] = false;
                j += i;
            }
        }
    }
    return array;
}

unsigned int findPrime(unsigned int primeNumber, unsigned int limit)
{
    std::vector<bool> primes = getPrimes(limit);
    unsigned int count = 0;
    for (unsigned int i = 1; i <= primes.size(); i++)
    {
        if (primes[i])
            count++;
        if (count == primeNumber)
            return i;
    }
    return -1;
    
}

int main(int argc, const char * argv[]) {
    std::cout << findPrime(atoi(argv[1]), atoi(argv[2])) << std::endl;;
    return 0;
}
