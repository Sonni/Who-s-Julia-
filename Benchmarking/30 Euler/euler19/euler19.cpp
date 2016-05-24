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

unsigned int calc(unsigned int minYear, unsigned int maxYear)
{
    unsigned int count = 0;
    unsigned int daysMonth = 0;
    unsigned int passed = 1;
    
    for (unsigned int i = minYear; i <= maxYear; i++)
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
    
    unsigned int minYear = std::atoi(argv[1]);
    unsigned int maxYear = std::atoi(argv[2]);
    
    std::cout << calc(minYear, maxYear) << std::endl;
    
    return 0;
}
