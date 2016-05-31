//
//  main.cpp
//  Euler7
//
//  Created by Sonni on 19/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

bool isPrime(unsigned int x)
{
    unsigned int divisor = 2;
    bool prime = true;
    while (divisor < x)
    {
        if (x % divisor == 0)
        {
            prime = false;
            break;
        }
        divisor++;
    }
    return prime;
}

void findPrime(unsigned int primeNumber)
{
    std::vector<unsigned int> arrayPrimes;
    unsigned int counter = 0;
    unsigned int number = 2;
    
    while (counter < primeNumber)
    {
        if (isPrime(number))
        {
            counter++;
            if (counter == primeNumber)
                break;
        }
        number++;
    }
    arrayPrimes.push_back(number);
    std::cout << arrayPrimes[arrayPrimes.size()-1] << std::endl;
}

int main(int argc, const char * argv[]) {
    findPrime(atoi(argv[1]));
    return 0;
}
