#include <stdio.h>
#include <ctime>
#include <iostream>
#include <chrono>
#include <thread>

int main( int argc, const char* argv[] )
{
	std::clock_t    start;

    start = time(0);
	std::this_thread::sleep_for(std::chrono::milliseconds(10000));
    std::cout << "Time: " << (time(0) - start) << " s" << std::endl;
}
