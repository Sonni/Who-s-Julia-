//
//  main.cpp
//  euler31
//
//  Created by Sonni on 23/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>

//Run ./euler31 200
// answer = 73682

unsigned int calc(unsigned int target)
{
    unsigned int result = 0;
    
    for (int i = target; i >= 0; i -= target) //2 Pounds
        for (int j = i; j >= 0; j -= 100) //1 pound
            for (int k = j; k >= 0; k -= 50) //50 pence
                for (int x = k; x >= 0; x -= 20) //20 pence
                    for (int y = x; y >= 0; y -= 10) //10 pence
                        for (int z = y; z >= 0; z -= 5) //5 pence
                            for (int w = z; w >= 0; w -= 2) //2 pence
                                //for (int l = w; l >= 0; l -= 1) //1 pence
                                    result++;

    return result;
}

int main(int argc, const char * argv[]) {
    std::cout << calc(atoi(argv[1])) << std::endl;

    return 0;
}
