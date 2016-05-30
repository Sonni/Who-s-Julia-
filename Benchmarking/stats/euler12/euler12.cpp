//
//  main.cpp
//  Euler12
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <limits>
#include <math.h>
#include <vector>
#include <set>
#include <map>

std::vector<int> prime_factors(unsigned int n)
{
    std::vector<int> factors;
    unsigned int d = 2;
    while (n > 1)
    {
        while (n % d == 0)
        {
            factors.push_back(d);
            n /= d;
        }
        d++;
    }
    return factors;
}

unsigned int triangular(unsigned int div)
{
    unsigned int limit = std::numeric_limits<int16_t>::max();
    unsigned int i = 0;
    for (unsigned int n = 1; n <= limit; n++)
    {
        i += n;
        unsigned int countDiv = 1;
        std::vector<int> fact = prime_factors(i);
        std::vector<int> distinct = fact;

        std::sort(distinct.begin(), distinct.end()); // can't do this, 
        std::vector<int>::iterator it = std::unique(distinct.begin(), distinct.end());
        distinct.erase(it, distinct.end());
       
        
        std::vector<unsigned int> countExp;
        std::map<int, int> dict;

        for (unsigned int i = 0; i < distinct.size(); i++)
        {
            for (unsigned int j = 0; j < fact.size(); j++)
            {
                if (distinct[i] == fact[j])
                {
                    if (dict.count(distinct[i]) != 0)
                    {
                        dict[distinct[i]] = dict[distinct[i]] + 1;
                    }
                    else
                        dict[distinct[i]] = 1;
                }
            }
        }
        
        
        for(std::map<int,int>::iterator it = dict.begin(); it != dict.end(); ++it)
        {
            countDiv *= dict[it->first] + 1;
        }
        if (countDiv > div)
            return i;
    }
    return -1;
}

int main(int argc, const char * argv[]) {
    triangular(atoi(argv[1]));
    return 0;
}
