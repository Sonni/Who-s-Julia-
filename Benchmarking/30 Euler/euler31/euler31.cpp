//
//  main.cpp
//  euler31
//
//  Created by Sonni on 23/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

unsigned int calc(unsigned int target)
{
    int conSizes[] = {1, 2, 5, 10, 20, 50, 100, 200};
    int ways[target + 1];
    for (unsigned int i = 0; i < target + 1; i++)
        ways[i] = 0;
    ways[0] = 1;
    
    for (unsigned int i = 0; i < sizeof(conSizes)/sizeof(*conSizes); i++)
    {
        for (unsigned int j = conSizes[i]; j <= target ; j++)
        {
            ways[j] += ways[j - conSizes[i]];
        }
    }
    
    return ways[target];
}

int main(int argc, const char * argv[]) {
    calc(atoi(argv[1]));
    return 0;
}
