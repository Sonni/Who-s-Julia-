//
//  main.cpp
//  Euler8
//
//  Created by Sonni on 19/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <string>
#include <fstream>

unsigned int adja(std::string n)
{
    unsigned int i = 0;
    unsigned long currentProd = 1;
    unsigned long maxProd = 0;
    
    while (i < n.size() - 12)
    {
        for (unsigned int j = 0; j < 13; j++)
        {
            //std::cout << n[i + j] << " ";
            currentProd *= (int) n[i + j] - 48; //ascii code numbers start from 48
        }
        if (currentProd > maxProd)
        {
            maxProd = currentProd;
            
        }
        currentProd = 1;
        i += 1;
    }
    return maxProd;
}

int main(int argc, const char * argv[]) {
    std::ifstream infile(argv[1]);
    unsigned int row = 0;
    
    std::string line;
    std::getline(infile, line);
        
    adja(line);
    return 0;
}
