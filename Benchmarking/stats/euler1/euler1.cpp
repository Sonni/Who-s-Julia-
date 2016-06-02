//
//  main.cpp
//  Euler1
//
//  Created by Sonni on 19/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

unsigned long long f1(unsigned long long n)
{
    unsigned long long sum = 0;
    for (unsigned long long i = 0; i < n; i++)
    {
        if (i % 3 == 0 || i % 5 == 0)
            sum += i;
    }

    return sum;
}

int main(int argc, const char * argv[]) {
  std::cout << atoll(argv[1]) << std::endl;
    f1(atoll(argv[1]));
    return 0;
}
