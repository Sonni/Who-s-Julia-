//
//  main.cpp
//  Euler19
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <sstream>
#include <string>

long long calc(long long minYear, long long maxYear)
{
    long long count = 0;
    unsigned int daysMonth = 0;
    long long passed = 1;
    
    for (long long i = minYear; i <= maxYear; i++)
    {
        for (unsigned int j = 1; j <= 12; j++)
        {
            if (j == 4 || j == 6 || j == 9 || j == 11)
                daysMonth = 30;
            else if (j == 2)
            {
                if (i % 400 == 0 || (i % 4 == 0 && i % 100 == 0))
                    daysMonth = 29;
                else
                    daysMonth = 28;
            }
            else
                daysMonth = 31;
            
            if (passed % 7 == 0)
                count++;
            
            passed += daysMonth;
        }
    }
    return count;
}

int main(int argc, const char * argv[]) {
    
    long long minYear = std::atoi(argv[1]);
    long long maxYear = std::atoi(argv[2]);
    
    calc(minYear, maxYear);
    
    return 0;
}
