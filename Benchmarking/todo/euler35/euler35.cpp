//
//  main.cpp
//  Euler35
//
//  Created by Sonni on 21/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

std::vector<bool> getBoolPrimes(unsigned int size)
{
    std::vector<bool> array;
    for (unsigned int i = 0; i <= size; i++)
        array.push_back(true);
    
    for (unsigned int i = 2; i <= size; i++)
    {
        if (array[i] == true)
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

std::vector<unsigned int> getPrimes(std::vector<bool> array, unsigned int size)
{
    std::vector<unsigned int> primeArray;
    for (unsigned int i = 2; i <= size; i++)
        if (array[i])
            primeArray.push_back(i);
    
    return primeArray;
}

std::string rotate(std::string s)
{
    std::string first = s.substr(0, 1);
    std::string last = s.substr(1, s.length());
    return last + first;
}

unsigned int calc(unsigned int limit)
{
    unsigned int count = 0;
    std::vector<bool> primesBool = getBoolPrimes(limit);
    std::vector<unsigned int> primes = getPrimes(primesBool, limit);
    
    for (unsigned int i = 0; i < primes.size(); i++)
    {
        std::string s = std::to_string(primes[i]);
        unsigned int l = s.size();
        bool circPrime = true;
        for (unsigned int i = 0; i < l; i++)
        {
            s = rotate(s);
            int n = std::stoi(s);
            if (!primesBool[n])
            {
                circPrime = false;
                break;
            }
        }
        if (circPrime)
            count++;
    }
    return count;
}

int main(int argc, const char * argv[]) {
    calc(atoi(argv[1]));
    return 0;
}
