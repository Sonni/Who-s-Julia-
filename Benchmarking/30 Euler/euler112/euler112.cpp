//
//  main.cpp
//  Euler112
//
//  Created by Sonni on 22/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

bool bouncy(unsigned int number)
{
    bool inc = false;
    bool dec = false;
    
    unsigned int last = number % 10;
    number = number / 10;
    
    while (number > 0)
    {
        unsigned int next = number % 10;
        number = number / 10;
        
        if (next < last)
            inc = true;
        else if (next > last)
            dec = true;
        
        last = next;
        
        if (dec && inc)
            return true;
    }
    return (dec && inc);
}

unsigned int calc(unsigned int limit)
{
    unsigned int i = 99;
    unsigned int bouncies = 0;
    
    while (100 * bouncies < 99 * i)
    {
        i++;
        if (bouncy(i))
            bouncies++;
    }
    return i;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << calc(atoi(argv[1])) << std::endl;
    return 0;
}
