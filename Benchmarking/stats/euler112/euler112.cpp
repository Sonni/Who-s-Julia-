//
//  main.cpp
//  Euler112
//
//  Created by Sonni on 22/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

bool kind( int n)
{
    std::string s = std::to_string(n);
    unsigned int l = s.size();
    unsigned int i = 1;
    unsigned int j = i + 1;
    bool decr = false, bouncy = false, incr = false;
    
    while (j < l)
    {
        unsigned int a = (int) s[i];
        unsigned int b = (int) s[j];
        if (a > b)
            decr = true;
        else if (a < b)
            incr = true;
        
        i++;
        j++;
    }
    if (decr && incr)
        return true;
    
    return false;
}

long long calc(long long prop)
{
    int currentProb = 0;
    
    long long i = 100;
    int countBouncy = 0;
    
    while (currentProb < prop)
    {
        if (kind(i))
            countBouncy++;
        
        currentProb = (countBouncy * 100) / i;
        
        if (currentProb >= prop)
            return i;
        i++;
    }
    
    return -1;
}

int main(int argc, const char * argv[]) {
    calc(atoi(argv[1]));
    return 0;
}
