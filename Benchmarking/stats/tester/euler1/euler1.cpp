//
//  main.cpp
//  Euler1
//
//  Created by Sonni on 19/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

void f1(unsigned long long n)
{
    unsigned long long sum = 0;
    for (unsigned long long i = 0; i < n; i++)
    {
        if (i % 3 == 0 || i % 5 == 0)
            sum += i;
    }

    //std::cout << sum << std::endl;
}

int main(int argc, const char * argv[]) {
    f1(atoi(argv[1]));
    return 0;
}
