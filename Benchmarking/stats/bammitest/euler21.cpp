//
//  main.cpp
//  Euler21
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

unsigned int sum_divisors(unsigned int n)
{
    unsigned int sum = 0;
    int k = n - 1;

    for (int i = 1; i <= k; i++)
    {
        if (n % i == 0)
            sum += i;
    }
    return sum;
}

long long amica(long long a)
{
    unsigned int amicable = 0;
    long long sum = 0;
    
    for (unsigned int i = 1; i <= a; i++)
    {
        unsigned int b = sum_divisors(i);
        
        unsigned int c = sum_divisors(b);
        if (i == c && i != b)
        {
            amicable++;
            sum += i;
        }
    }
    return sum;
}

int main(int argc, const char * argv[]) {
    long long limit = atoi(argv[1]);
    amica(limit);
    return 0;
}
