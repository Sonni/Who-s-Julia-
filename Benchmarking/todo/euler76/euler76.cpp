//
//  main.cpp
//  euler76
//
//  Created by Sonni on 22/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>

unsigned long calc(int target, int k)
{
    if (target == 0 || k == 1)
        return 1;
    else if (target < 0 || k <= 0)
        return 0;
    return calc(target, k-1) + calc(target - k, k);
}

int main(int argc, const char * argv[]) {
    calc(atoi(argv[1]), atoi(argv[1])-1);
    return 0;
}
