//
//  main.cpp
//  Euler5
//
//  Created by Sonni on 19/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

unsigned long divisible(unsigned int div, unsigned long limit)
{
    for (unsigned long x = div + 1; x <= limit; x++)
    {
        bool evenlyDivis = true;
        if (x == limit)
            std::cout << "Done" << std::endl;
        for (unsigned int i = 2; i <= div; i++)
        {
            unsigned int n = x % i;
            if (n != 0)
            {
                evenlyDivis = false;
                break;
            }
        }
        if (evenlyDivis)
            return x;
    }
    return -1;
}

int main(int argc, const char * argv[]) {
    divisible(atoi(argv[1]), atoi(argv[2]));
    return 0;
}
