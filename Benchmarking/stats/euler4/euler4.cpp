//
//  main.cpp
//  Euler4
//
//  Created by Sonni on 19/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>
#include <math.h>
#include <string>
#include <algorithm>

std::vector<unsigned int> digitsInArray(unsigned int n)
{
    std::vector<unsigned int> array;
    unsigned int d;
    unsigned int k;
    while (n > 0)
    {
        d = floor(n / 10);
        k = n - d * 10;
        n = d;
        array.push_back(k);
    }
    std::reverse(array.begin(), array.end());
    return array;
}

bool isPalindrome(std::vector<unsigned int> array)
{
     unsigned int i = 0;
     unsigned long j =  array.size()-1;
    bool isPal = true;
    
    while (i <= j)
    {
        if (array[i] == array[j])
        {
            i++;
            j--;
        }
        else
        {
            isPal = false;
            break;
        }
    }
    
    return isPal;
}

 unsigned int checkNumber( unsigned int min,  unsigned int max)
{
    //unsigned int resultArray[2];
     unsigned int maxNum = 0;
    bool found = false;
    bool cycleDone = false;
    
    while (!found)
    {
        for ( unsigned int x = max; x >= min; x--)
        {
            for ( unsigned int y = max; y >= min; y--)
            {
                 unsigned int k = x * y;
                bool result = isPalindrome(digitsInArray(k));
                if (result)
                {
                    if (k > maxNum)
                    {
                        maxNum = k;
                        
                        //resultArray[0] = x;
                        //resultArray[1] = y;
                        found = true;
                    }
                }
            }
        }
        cycleDone = true;
        if (!found)
            break;
    }
    return maxNum;
}

int main(int argc, const char * argv[]) {
    std::cout << checkNumber(atoi(argv[1]), atoi(argv[2])) << std::endl;
    return 0;
}
