//
//  main.cpp
//  Euler22
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <map>

std::vector<std::string> split(std::string s, char delim)
{
    std::vector<std::string> elems;
    
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
        
        elems.push_back(s.substr(start, end - start));
        start = end + 1;
        end = start;
    }
    
    return elems;
}

std::map<char, int> letterValues()
{
    std::map<char, int> mapo;
    std::string letters[] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
    unsigned int valueLetter = 1;
    
    for (unsigned int a = 0; a < 26; a++)
    {
        mapo[*letters[a].c_str()] = valueLetter;
        valueLetter++;
    }
    
    return mapo;
}

unsigned long calc(std::map<char, int> mapo, std::vector<std::string> names_sorted)
{
    
    
    unsigned long value = 0;
    unsigned int mapo_index = 1;
    for (unsigned int i = 0; i < names_sorted.size(); i++)
    {
        unsigned long value_word = 0;
        for (unsigned int j = 0; j < names_sorted[i].size(); j++)
            value_word += mapo[names_sorted[i][j]];
            
        value += value_word * mapo_index;
        mapo_index++;
    }
    
    return value;
}

std::vector<std::string> namesSorted(std::string path)
{
    std::vector<std::string> array;
    
    std::ifstream infile(path);
    
    std::string line;
    while (std::getline(infile, line))
    {
        line.erase(std::remove(line.begin(), line.end(), '"'), line.end());
        array = split(line, ',');
    }
    
    std::sort(array.begin(), array.end());
    
    return array;
}

int main(int argc, const char * argv[]) {
    std::string file = argv[1];
    std::cout << calc(letterValues(), namesSorted(file)) << std::endl;
    return 0;
}
