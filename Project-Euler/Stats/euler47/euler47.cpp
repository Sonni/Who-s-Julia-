//
//  main.cpp
//  euler47
//
//  Created by Sonni on 23/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

unsigned int numFactors(unsigned int number, std::vector<unsigned int>& primeList)
{
    unsigned int nod = 0;
    bool pf = false;
    unsigned int remain = number;
    
    for (unsigned int i = 0; i < primeList.size(); i++)
    {
        if (primeList[i] * primeList[i] > number)
        {
            nod++;
            return nod;
        }
        
        pf = false;
        while (remain % primeList[i] == 0)
        {
            pf = true;
            remain = remain / primeList[i];
        }
        if (pf)
            nod++;
        
        if (remain == 1)
            return nod;
    }
    return nod;
}

std::vector<unsigned int> getPrimes(unsigned int size)
{
    std::vector<bool> array;
    for (unsigned int i = 0; i <= size; i++)
        array.push_back(true);

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
    for (unsigned int i = 2; i <= size; i++)
        if (array[i])
            primeArray.push_back(i);
    
    return primeArray;
}


unsigned int calc(unsigned int limit, unsigned int consec)
{
    std::vector<unsigned int> primeList = getPrimes(limit);
    unsigned int targetpf = consec;
    unsigned int targetcons = consec;
    unsigned int cons = 1;
    unsigned int result = 1;
    
    while (cons < targetcons)
    {
        result++;
        if (numFactors(result, primeList) >= targetpf)
            cons++;
        else
            cons = 0;
    }
    
    return result-3;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << calc(atoi(argv[2]), atoi(argv[1])) << std::endl;
    return 0;
}
