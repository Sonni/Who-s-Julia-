//
//  main.cpp
//  Euler14
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

void seq(unsigned int n)
{
    unsigned int max = 0;
    unsigned int max_number = 0;
    for (unsigned int i = 1; i <= n; i++)
    {
        unsigned int count_seq = 1;
        unsigned int temp = i;
        unsigned int tmpI = i;
        while (tmpI != 1)
        {
            
            if (tmpI % 2 == 0)
                tmpI /= 2;
            else
                tmpI = 3 * tmpI + 1;
            
            count_seq++;
        }
        if (count_seq > max)
        {
            max = count_seq;
            max_number = temp;
        }
    }
    
    return max_number;
}

int main(int argc, const char * argv[]) {
    seq(atoi(argv[1]));
    return 0;
}
