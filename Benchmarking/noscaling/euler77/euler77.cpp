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

unsigned int calc(unsigned int ways)
{
    unsigned int i = 2;
    while (true)
    {
        std::vector<unsigned int> arr;
        for (unsigned int k = 0; k <= i; k++)
            arr.push_back(0);
        arr[0] = 1;
        std::vector<unsigned int> primes = getPrimes(i);
        for (unsigned int p = 0; p < primes.size(); p++)
        {
            for (unsigned int j = primes[p]; j < arr.size(); j++)
            {
                arr[j] += arr[j - primes[p]];
            }
        }
        if (arr[i] > ways)
        {
            return i;
            break;
        }
        i++;
    }
}

int main(int argc, const char * argv[]) {
    calc(atoi(argv[1]));
    return 0;
}
