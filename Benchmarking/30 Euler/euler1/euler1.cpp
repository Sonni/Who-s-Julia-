//
//  main.cpp
//  Euler1
//
//  Created by Sonni on 19/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

void unsigned int f1(unsigned int n)
{
    unsigned int sum = 0;
    for (unsigned int i = 0; i < n; i++)
    {
        if (i % 3 == 0 || i % 5 == 0)
            sum += i;
    }
    
    return sum;
}

int main(int argc, const char * argv[]) {
    f1(atoi(argv[1]));
    return 0;
}
