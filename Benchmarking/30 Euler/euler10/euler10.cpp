//
//  main.cpp
//  Euler10
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>


std::vector<unsigned int> getPrimes(int size)
{
    std::vector<bool> array;
    for(int i = 0; i <= size; i++)
        array.push_back(true);
    
    array[1] = false;
    unsigned int c = 1;
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
            c += 1;
        }
    }
    std::vector<unsigned int> primeArray;
    for(unsigned int i = 2; i <= size; i++)
    {
        if(array[i])
        {
            primeArray.push_back(i);
        }
    }
    return primeArray;
}

int main(int argc, const char * argv[]) {
    unsigned int limit = atoi(argv[1]);
    unsigned long sum = 0;
    for(int i : getPrimes(limit))
    {
        sum += i;
    }
    //std::cout << sum << std::endl;
    return 0;
}
