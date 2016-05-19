#include <stdio.h>
#include <iostream>
#include <vector>
using namespace std;

int fibo(int n)
{
	vector<int> array;
	array.push_back(1);
	array.push_back(1);
	bool go = true; 
	int s = 0;
	int i = 2;
	int x = 0;
	while(go)
	{
		x = array[i-2] + array[i-1];
		if(x<n)
		{
			array.push_back(x);
			i += 1;
			if(x % 2 == 0)
			{
				s += x;
			}
		}
		else
		{
			go = false;
		}
	}
	return s;
}

int main(int argc, const char* argv[])
{
	cout << fibo(4000000);
	return 0;
}
