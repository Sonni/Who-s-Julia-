//
//  main.cpp
//  Euler15
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

unsigned long calc(unsigned int siz)
{
    unsigned long mat[siz + 1][siz + 1];
    for (unsigned int i = 0; i < siz+1; i++)
        for (unsigned int j = 0; j < siz+1; j++)
            mat[i][j] = 1;
    
    for (int i = siz - 1; i >= 0; i--)
        for (int j = siz - 1; j >= 0; j--)
            mat[i][j] = mat[i+1][j] + mat[i][j+1];
        
    
    return mat[0][0];
}

int main(int argc, const char * argv[]) {
    std::cout << calc(atoi(argv[1])) << std::endl;;
    return 0;
}
