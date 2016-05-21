//
//  main.cpp
//  Euler15
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

unsigned long calc(unsigned int gridSize)
{
    unsigned long grid[gridSize + 1][gridSize + 1];
    for (unsigned int i = 0; i < gridSize+1; i++)
        for (unsigned int j = 0; j < gridSize+1; j++)
            grid[i][j] = 1;
    
    for (int i = gridSize - 1; i >= 0; i--)
        for (int j = gridSize - 1; j >= 0; j--)
            grid[i][j] = grid[i+1][j] + grid[i][j+1];
        
    
    return grid[0][0];
}

int main(int argc, const char * argv[]) {
    std::cout << calc(atoi(argv[1])) << std::endl;;
    return 0;
}
