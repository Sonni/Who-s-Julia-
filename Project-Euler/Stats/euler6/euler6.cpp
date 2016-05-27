//
//  main.cpp
//  Euler6
//
//  Created by Sonni on 19/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <math.h>

int diffe(unsigned int n)
{
    unsigned int sumFirst = 0;
    unsigned int sumSecond = 0;
    unsigned temp = 0;
    
    for (unsigned int i = 1; i <= n; i++)
        sumFirst += pow(i, 2);
    
    for (unsigned int j = 1; j <= n; j++)
        temp += j;
    
    sumSecond = pow(temp, 2);
    int res = sumSecond - sumFirst;
    if (res < 0)
        return res += res * -2;
    else
        return res;
}

int main(int argc, const char * argv[]) {
    std::cout << diffe(atoi(argv[1])) << std::endl;;
    return 0;
}
