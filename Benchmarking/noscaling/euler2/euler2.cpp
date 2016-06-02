//
//  main.cpp
//  Euler2
//
//  Created by Sonni on 19/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

void fibo(unsigned long long n)
{
    std::vector<unsigned int> array;
    array.push_back(1); array.push_back(1);
    unsigned int i = 2;
    bool go = true;
    unsigned long long sum = 0;

    while (go)
    {
        unsigned int x = array[i-2] + array[i-1];

        if (x < n)
        {
            array.push_back(x);
            i += 1;
            if (x % 2 == 0)
                sum += x;
        }
        else
            go = false;
    }
}

int main(int argc, const char * argv[]) {
    fibo(atoi(argv[1]));
    return 0;
}
