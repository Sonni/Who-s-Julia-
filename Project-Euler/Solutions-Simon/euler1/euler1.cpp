#include <stdio.h>
#include <iostream>
using namespace std;

int f1 (int n)
{
	int i;
	int sum = 0;
	
	for(i = 1; i < n; i++) 
	{
		if(i % 3 == 0 || i % 5 == 0)
		{
			sum += i;
		}
	}
	
	return sum;
}

int main(int argc, const char* argv[])
{
	cout << f1(1000);
	return 0;
}
