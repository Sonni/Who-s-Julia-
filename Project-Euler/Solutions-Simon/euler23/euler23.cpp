//
//  main.cpp
//  Euler23
//
//  Created by Sonni on 21/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>
#include <math.h>

unsigned int sum_divisors(unsigned int n)
{
    unsigned int sum = 1;
    unsigned int limit = floor(n * 0.5) + 1;
    for (unsigned int i = 2; i < limit; i++)
    {
        if (n % i == 0)
            sum += i;
    }
    return sum;
}

bool is_abundant(unsigned int n)
{
    if (sum_divisors(n) > n)
        return true;
    return false;
}

std::vector<unsigned int> find_abundants(unsigned int limit)
{
    std::vector<unsigned int> abundants;
    for (unsigned int i = 1; i <= limit; i++)
    {
        if (is_abundant(i))
            abundants.push_back(i);
    }
    return abundants;
}

std::vector<unsigned int> get_list(unsigned int limit)
{
    std::vector<unsigned int> abds = find_abundants(limit);
    std::vector<unsigned int> list;
    
    for (unsigned int i = 0; i < limit; i++)
        list.push_back(i);
    
    for (unsigned int x = 0; x < abds.size(); x++)
    {
        for (unsigned int y = 0; y < abds.size(); y++)
        {
            
            if (abds[x]+abds[y] >= limit)
                break;
            
            list[abds[x]+abds[y]] = 0;
        }
    }
    return list;
}

int main(int argc, const char * argv[])
{
    std::vector<unsigned int> list = get_list(atoi(argv[1]));
    unsigned int sum = 0;
    for (unsigned int i = 0; i < list.size(); i++)
        sum += list[i];
    
    std::cout << sum << std::endl;;
    return 0;
}
