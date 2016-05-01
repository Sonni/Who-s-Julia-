#include <stdio.h>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;

namespace patch
{
    template <typename T> std::string to_string(const T& n)
    {
        std::ostringstream stm;
        stm << n;
        return stm.str();
    }
}

int main(int argc, char** argv) 
{
    int p = 3;
    int q = 6;
    p = p + q;
    
    std::string s = patch::to_string(p) + "\n";
    
    printf(s.c_str());
}


