//
//  main.cpp
//  Euler77
//
//  Created by Sonni on 22/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

std::vector<unsigned int> getPrimes(unsigned int size)
{
    std::vector<bool> array;
    for (unsigned int i = 1; i <= size; i++)
        array.push_back(true);
    
    array[1] = false;
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
    std::vector<unsigned int> primeArray;
    for (unsigned int i = 1; i < size; i++)
        if (array[i])
            primeArray.push_back(i);
    
    return primeArray;
}

unsigned int calc(unsigned int ways, unsigned int limit)
{
    std::vector<unsigned int> primes = getPrimes(limit);
    
    unsigned int target = 2;
    while (true)
    {
        unsigned int way[target + 1];
        for (unsigned int i = 0; i < target + 1; i++)
            way[i] = 0;
        way[1] = 1;
        
        for (unsigned int i = 0; i < target + 1; i++)
            for (unsigned int j = primes[i]; j < target; j++)
                way[j + 1] += way[j + 1 - primes[i]];
        
        if (way[target] > ways)
            return target - 1;
        
        target++;
    }
}

int main(int argc, const char * argv[]) {
    std::cout << calc(atoi(argv[1]), atoi(argv[2])) << std::endl;;
    return 0;
}
