//
//  main.cpp
//  Euler20
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <math.h>
#include <vector>

int power (int number, int index) {
    if (index == 0) {
        return 1;
    }
    int num = number;
    for (int i = 1; i < index; i++) {
        number = number * num;
    }
    return number;
}


unsigned getNumberOfDigits (unsigned i)
{
    return i > 0 ? (int) log10((double) i) + 1 : 1;
}

unsigned int getDigitAtIndex(unsigned int index, unsigned int number) {
    const unsigned int size = getNumberOfDigits(number);
    unsigned int arr[size];
    int tempNumber = number;
    for (int i = 1; i <= size; i++) {
        int index = size - i;
        int digit = tempNumber / power(10, index);
        arr[i-1] = digit;
        tempNumber = tempNumber - power(10, index) * digit;
    }
    return arr[index];
}

unsigned int sum_digits(unsigned long l)
{
    unsigned int sum;
    for (unsigned int i = 0; i < getNumberOfDigits(l); i++)
    {
        
        sum += getDigitAtIndex(i, l);
    }
    
    return sum;
}

unsigned long fact(unsigned int n) //not big enough int
{
    unsigned long long res = 1;
    for (unsigned int i = n; i >= 1; i--)
    {
        std::cout << res << std::endl;
        res *= i;
    }
    return res;
}

unsigned int calc(std::vector<unsigned int> arr, unsigned int num)
{
    unsigned int sum = 0;
    unsigned int carry = 0;
    for (unsigned int i = 2; i <= num; i++)
    {
        unsigned int len = arr.size() - 1;
        for (int j = len; j >= 0; j--)
        {
            unsigned int temp = arr.at(j) * i;
            if (temp > 9)
            {
                while (temp > 9)
                {
                    temp -= 10;
                    carry++;
                }
                arr.at(j) = temp;
                if (j == len)
                    arr.push_back(carry);
                else
                    arr.at(j + 1) += carry;
                carry = 0;
            }
            else
                arr[j] = temp;
        }
        
        
        for (unsigned int j = 0; j < arr.size(); j++)
        {
            unsigned int temp = arr.at(j);
            if (temp > 9)
            {
                while (temp > 9)
                {
                    temp -= 10;
                    carry += 1;
                }
                arr.at(j) = temp;
                if (carry > 0 && j + 1 == arr.size())
                    arr.push_back(carry);
                else if (carry > 0)
                    arr.at(j + 1) += carry;
                
                carry = 0;
            }
        }
    }
    for (unsigned int i = 0; i < arr.size(); i++)
        sum += arr[i];
    
    return sum;
}

int main(int argc, const char * argv[]) {
    std::vector<unsigned int> arr;
    arr.push_back(1);
    calc(arr, atoi(argv[1]));
    return 0;
}
