//
//  main.cpp
//  euler76
//
//  Created by Sonni on 22/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

unsigned long calc(unsigned int target)
{
    std::vector<unsigned int> ways;
    for (unsigned int i = 0; i <= target; i++)
        ways.push_back(0);
    
    ways[0] = 1;
    
    for (unsigned int i = 1; i <= target - 1; i++)
    {
        for (unsigned int j = i; j <= target; j++)
        {
            ways.at(j) += ways.at(j - i);
        }
    }
   
    return ways.at(ways.size() - 1);
}

int main(int argc, const char * argv[]) {
    calc(atoi(argv[1]));
    return 0;
}
