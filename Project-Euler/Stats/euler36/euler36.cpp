//
//  main.cpp
//  euler36
//
//  Created by Sonni on 23/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

unsigned int createPalindrome(unsigned int input, unsigned int base, bool isOdd)
{
    unsigned int n = input;
    unsigned int palin = input;
    if (isOdd)
        n = n / base;
    
    while (n > 0)
    {
        palin = palin * base + (n % base);
        n = n / base;
    }
    return palin;
}

bool isPalindrome(unsigned int number, unsigned int base)
{
    unsigned int reversed = 0;
    unsigned int k = number;
    while (k > 0)
    {
        reversed = base * reversed + (k % base);
        k = k / base;
    }
    if (number == reversed)
        return true;
    else
        return false;
}

unsigned int calc(unsigned int limit)
{
    unsigned int result = 0;
    bool isOdd;
    for (unsigned int j = 1; j <= 2; j++)
    {
        if (j % 2 == 0)
            isOdd = false;
        else
            isOdd = true;
        
        unsigned int i = 1;
        unsigned int number = createPalindrome(i, 10, isOdd);
        while (number < limit)
        {
            if (isPalindrome(number, 2))
                result += number;
            i++;
            number = createPalindrome(i, 10, isOdd);
        }
    }
    return result;
}

int main(int argc, const char * argv[]) {
    std::cout << calc(atoi(argv[1])) << std::endl;;
    return 0;
}
