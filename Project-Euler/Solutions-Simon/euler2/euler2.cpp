//
//  main.cpp
//  Euler2
//
//  Created by Sonni on 19/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

void printVector(std::vector<unsigned int>& array)
{
    for (int i = 0; i < array.size(); i++)
        std::cout << array[i] << ", ";
}

void fibo(unsigned int n)
{
    std::vector<unsigned int> array;
    array.push_back(1); array.push_back(1);
    unsigned int i = 2;
    bool go = true;
    unsigned int sum = 0;
    
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
    
    std::cout << sum << std::endl;
    printVector(array);
}

int main(int argc, const char * argv[]) {
    fibo(atoi(argv[1]));
    return 0;
}
