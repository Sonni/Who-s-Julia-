//
//  main.cpp
//  Euler30
//
//  Created by Sonni on 21/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>
#include <math.h>
#include <algorithm>

std::vector<unsigned int> digs(int n)
{
    std::vector<unsigned int> arr;
    while (n > 0)
    {
        int d = n / 10;
        int k = n - d * 10;
        n = d;
        arr.push_back(k);
        //std::cout << s << std::endl;
    }
    std::reverse(arr.begin(), arr.end());
    return arr;
}

void calc(unsigned int x, unsigned int y)
{
    unsigned int temp = 0;
    unsigned int total = 0;
    for (int i = 2; i <= x; i++)
    {
        std::vector<unsigned int> k = digs(i);
        temp = i;
        unsigned int sum = 0;
        for (unsigned int j = 0; j < k.size(); j++)
        {
            sum += pow(k[j], y);
        }
        if (sum == temp)
            total += sum;
    }
    std::cout << total << std::endl;
}

int main(int argc, const char * argv[]) {
    unsigned int number = atoi(argv[1]);
    unsigned int power = atoi(argv[2]);
    
    calc(number, power);
    return 0;
}
