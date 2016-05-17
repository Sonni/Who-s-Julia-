#include <stdio.h>
#include <ctime>
#include <iostream>
#include <chrono>
#include <thread>

int main( int argc, const char* argv[] )
{
	std::clock_t    start;

    start = time(0);
    int goal = 10000;
    while(true)
    {
    	if(time(0) - start > goal)
    	{
    		break;
    	}
    }
    std::cout << "Time: " << (time(0) - start) << " s" << std::endl;
}
