//
//  main.cpp
//  Euler16
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>
unsigned int calc(unsigned int num, unsigned int power)
{
    unsigned int arrSize = power;
    std::vector<unsigned int> arr;
    for (int i = 0; i < arrSize; i++)
        arr.push_back(0);
    arr[0] = num;

    int sum = 0;
    int carry = 0;
    for (unsigned int i = 1; i < power; i++)
    {
        for (unsigned int j = 0; j < arr.size(); j++)
        {
            unsigned int temp = arr[j] * 2;
            if (temp > 9)
            {
                arr[j] = temp % 10 + carry;
                carry = 1;
            }
            else
            {
                arr[j] = temp + carry;
                carry = 0;
            }
        }
    }

    for (int i = 0; i < arr.size(); i++)
    {
        sum += arr[i];
    }



    return sum;
}

int main(int argc, const char * argv[]) {
    unsigned int num = atoi(argv[1]);
    unsigned int power = atoi(argv[2]);

    calc(num, power);

    return 0;
}
