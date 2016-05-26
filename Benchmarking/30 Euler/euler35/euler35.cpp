//
//  main.cpp
//  Euler35
//
//  Created by Sonni on 21/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

std::vector<bool> getPrimes(unsigned int size)
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

unsigned int calc(unsigned int limit)
{
    unsigned int count = 0;
    std::vector<bool> primes = getPrimes(limit);
    
    for (unsigned int num = 2; num <= limit; num++)
    {
        bool q = false;
        std::string numString = std::to_string(num);
        
        for (int i = 0; i < numString.size(); i++)
        {
            unsigned int index = std::stoi(numString.substr(i) + numString.substr(0, i));
            if (primes[index])
                q = true;
            else
            {
                q = false;
                break;
            }
        }
        if (q)
            count += 1;
    }
    
    return count;
}

int main(int argc, const char * argv[]) {
    std::cout << calc(atoi(argv[1])) << std::endl;
    return 0;
}
