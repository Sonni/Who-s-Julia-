//
//  main.cpp
//  Euler18
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <vector>
#include <fstream>
#include <algorithm>

std::vector<unsigned int> split_string_to_ints(std::string s, char delim)
{
    std::vector<unsigned int> elems;
    
    const char* cstr = s.c_str();
    unsigned int strLength = (unsigned int)s.length();
    unsigned int start = 0;
    unsigned int end = 0;
    
    while(end <= strLength)
    {
        while(end <= strLength)
        {
            if(cstr[end] == delim)
                break;
            end++;
        }
        
        elems.push_back(std::stoi(s.substr(start, end - start)));
        start = end + 1;
        end = start;
    }
    
    return elems;
}

unsigned int sum(std::vector<std::vector<unsigned int>> data, unsigned int row)
{
    unsigned int c = data.size();
    
    for (unsigned int i = 0; i < c; i++)
        data[row][i] += std::max(data[row+1][i], data[row+1][i+1]);
   
    if (row == 0)
        return data[row][0];
    else
        return sum(data, row-1);
}

int main(int argc, const char * argv[])
{
    std::vector<std::vector<unsigned int>> rows;
    
    std::ifstream infile(argv[1]);
    unsigned int lines = 0;
    
    std::string line;
    while (std::getline(infile, line))
    {
        std::vector<unsigned int> s = split_string_to_ints(line, ' ');
        std::vector<unsigned int> tmp;
        for (unsigned int i = 0; i < s.size(); i++)
        {
            tmp.push_back(s[i]);
        }
        rows.push_back(tmp);
        lines++;
    }
    infile.close();
    
    std::cout << sum(rows, lines-2) << std::endl;
    return 0;
}
