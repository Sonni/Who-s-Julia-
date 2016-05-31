//
//  main.cpp
//  euler52
//
//  Created by Sonni on 22/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <algorithm>

long long calc(long long limit)
{
    long long num = 0;
    
    for (long long i = 5; i <= limit; i++)
    {
        std::string x1 = std::to_string(i);
        std::sort(x1.begin(), x1.end());
        
        std::string x2 = std::to_string(i * 2);
        std::sort(x2.begin(), x2.end());
        
        std::string x3 = std::to_string(i * 3);
        std::sort(x3.begin(), x3.end());
        
        std::string x4 = std::to_string(i * 4);
        std::sort(x4.begin(), x4.end());
        
        std::string x5 = std::to_string(i * 5);
        std::sort(x5.begin(), x5.end());
        
        std::string x6 = std::to_string(i * 6);
        std::sort(x6.begin(), x6.end());
        
        if (x1 == x2 && x2 == x3 && x3 == x4 && x4 == x5 && x5 == x6)
        {
            num = i;
            break;
        }
    }
    return num;
}

int main(int argc, const char * argv[]) {
    calc(atoi(argv[1]));
    return 0;
}
