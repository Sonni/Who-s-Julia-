//
//  main.cpp
//  Euler3
//
//  Created by Sonni on 19/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>


void prime_factors(unsigned long n)
{
    std::vector<unsigned int> factors;
    unsigned int d = 2;
    while (n > 1)
    {
        while (n % d == 0)
        {
            factors.push_back(d);
            n /= d;
        }
        d += 1;
    }
}

int main(int argc, const char * argv[]) {
    prime_factors(atoi(argv[1]));
    return 0;
}
