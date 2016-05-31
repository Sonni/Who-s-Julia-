//
//  main.cpp
//  Euler9
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <map>

unsigned int pytha(long long number)
{
    std::map<std::string, unsigned int> map;
    for(unsigned int a = 1; a <= number / 3; a++)
    {
        for (unsigned int b = a + 1; b < number / 2; b++)
        {
            unsigned int c = number - a - b;
            if (a*a + b*b == c*c)
            {
                map["a"] = a;
                map["b"] = b;
                map["c"] = c;
            }
        }
    }
    
    std::cout << map["a"] << ", " << map["b"] << ", " << map["c"] << std::endl;
    
    unsigned int x = map["a"] * map["b"] * map["c"];
    return x;
}

int main(int argc, const char * argv[]) {
    pytha(atoi(argv[1]));
    return 0;
}
