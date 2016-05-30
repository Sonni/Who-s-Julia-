//
//  main.cpp
//  euler36
//
//  Created by Sonni on 23/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>
#include <bitset>

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

bool isPalindrome(std::string s)
{
    unsigned int i = 0;
    unsigned int j = s.size() - 1;
    bool isPal = true;
    //std::cout << s << std::endl;
    while (i < j)
    {
        if (s[i] == s[j])
        {
            i++;
            j--;
        }
        else
        {
            isPal = false;
            return isPal;
        }
    }
    return isPal;
}

std::string binary(unsigned int n){
    std::vector<unsigned int> bina;
    while (n > 0)
    {
        if (n % 2 == 0)
            bina.push_back(0);
        else
            bina.push_back(1);
        
        n /= 2;
    }
    std::string s = "";
    for (unsigned int i = 0; i < bina.size(); i++)
        s += std::to_string(bina[i]);
    
    return s;
}

unsigned long calc(unsigned int limit)
{
    unsigned long sum = 0;
    std::vector<unsigned int> numbers;
    for (unsigned int i = 1; i <= limit; i++)
    {
        std::string b = binary(i);
        if (isPalindrome(std::to_string(i)) && isPalindrome(b))
        {
            sum += i;
        }
    }
    return sum;
}

int main(int argc, const char * argv[]) {
    calc(1000000);
    return 0;
}
