#include <stdio.h>
#include <iostream>
#include <chrono>
#include <thread>

int main( int argc, const char* argv[] )
{	
	using namespace std::chrono;
	
	milliseconds oldtime = duration_cast<milliseconds>(
    	system_clock::now().time_since_epoch()
	);
    milliseconds goal = milliseconds(10000);
    milliseconds newtime = milliseconds(0);
    
    while(true)
    {
    	newtime = duration_cast<milliseconds>(
			system_clock::now().time_since_epoch()
		);
    	if(duration_cast<milliseconds>(newtime).count() - duration_cast<milliseconds>(oldtime).count() > duration_cast<milliseconds>(goal).count())
    	{
    		break;
    	}
    }
    std::cout << "Time: " << (duration_cast<milliseconds>(newtime).count() - duration_cast<milliseconds>(oldtime).count()) << " s" << std::endl;
}
