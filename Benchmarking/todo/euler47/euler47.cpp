//
//  main.cpp
//  euler47
//
//  Created by Sonni on 23/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>
#include <limits>
#include <algorithm>
#include <vector>
#include <set>
#include <math.h>

std::vector< int> prime_factors(unsigned int n)
{
    std::vector< int> factors;
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

unsigned int calc(unsigned int cons, unsigned int dist)
{
    unsigned long m = 9223372036854775807;//std::numeric_limits<int32_t>::max();
    unsigned int currentCons = 0;
    for (unsigned int i = 0; i <= m; i++)
    {
        std::vector< int> arr = prime_factors(i); //REmove dublicates
        std::sort(arr.begin(), arr.end());
        std::vector<int>::iterator it = std::unique(arr.begin(),arr.end());
        arr.erase(it,arr.end());
        
        if (arr.size() == dist)
        {
            currentCons++;
            if (currentCons == cons)
                return i - (cons - 1);
        }
        else
            currentCons = 0;
    }
    
    return -1;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << calc(atoi(argv[1]), atoi(argv[2])) << std::endl;
    return 0;
}
