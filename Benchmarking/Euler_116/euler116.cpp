//
//  main.cpp
//  euler116
//
//  Created by Sonni on 25/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

unsigned long solve(unsigned int m, unsigned int n)
{
    if (m > n)
        return 0;
    
    unsigned long solutions = 0;
    
    for (unsigned int i = m; i <= n; i++)
    {
        solutions++;
        solutions += solve(m, n-i);
    }
    return solutions;
}

int main(int argc, const char * argv[]) {
    unsigned int size = atoi(argv[1]);
    unsigned int numColors = atoi(argv[2]);
    
    unsigned long result;
    for (unsigned int i = 0; i < numColors; i++)
        result += solve(2+i, size);
    
    //std::cout << result << std::endl;
    return 0;
}

