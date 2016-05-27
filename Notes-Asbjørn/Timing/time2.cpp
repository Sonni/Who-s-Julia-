#include <stdio.h>
#include <iostream>
#include <time.h>

int main( int argc, const char* argv[] )
{	
	clock_t t;
	t = clock();
	
    int goal = 10000000;
    
    while(true)
    {
    	if(clock() - t > goal)
    	{
    		break;
    	}
    }
    std::cout << "Time: " << (clock() - t)/1000 << " ms" << std::endl;
}
