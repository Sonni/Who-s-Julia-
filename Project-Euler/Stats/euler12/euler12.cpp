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

unsigned int divisors(unsigned int n)
{
    unsigned int numberOfFactors = 0;
    unsigned int ceiling = std::numeric_limits<int16_t>::max();
    for (unsigned int i = 1; i < (int) (ceil(sqrt(n) + 1)); i++)
    {
        if (n % i == 0)
            numberOfFactors += 2;
        if (i*i == n)
            numberOfFactors--;
    }
    return numberOfFactors;
}

void triangular(unsigned int numDiv)
{
    unsigned int ceiling2 = std::numeric_limits<int16_t>::max();
    unsigned int count = 0;
    for (unsigned int n = 1; n <= ceiling2; n++)
    {
        unsigned int tn = (int) ((n * (n+1)) / 2);
        if (n % 2 == 0)
            count = divisors(n/2) * divisors(n+1);
        else
            count = divisors(n) * divisors((n+1) / 2);
        
        if (count > numDiv)
        {
            std::cout << tn << std::endl;
            break;
        }
    }
}

int main(int argc, const char * argv[]) {
    triangular(atoi(argv[1]));
    return 0;
}
