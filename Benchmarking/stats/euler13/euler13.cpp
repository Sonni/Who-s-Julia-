//
//  main.cpp
//  Euler13
//
//  Created by Sonni on 20/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <math.h>
#include <algorithm>

unsigned GetNumberOfDigits (unsigned i)
{
    return i > 0 ? (int) log10((double) i) + 1 : 1;
}

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

std::vector<std::vector<unsigned long> > makeData(std::string path)
{
    std::vector<std::vector<unsigned long> > mat;

    std::ifstream infile(path);
    unsigned int row = 0;

    std::string line;
    while (std::getline(infile, line))
    {
        std::string temp = line;
        std::string temp2 = temp;
        std::reverse(temp2.begin(), temp2.end());

        unsigned int col = 0;
        std::vector<unsigned long> tmp;
        for (unsigned int t = 0; t < temp2.size(); t++)
        {
            tmp.push_back((int) temp[t] - 48); //ascii numbers start at 48.

        }
        mat.push_back(tmp);
    }
    infile.close();

    return mat;
}

std::string calc(std::vector<std::vector<unsigned long> > mat)
{
    unsigned int mat_rows, mat_cols = (unsigned int) mat[0].size() - 1;
    unsigned int r = (unsigned int) mat.size()-1;
    unsigned int c = (unsigned int) mat[0].size()-1;
    std::vector<unsigned int> temp;


    for (int col = c; col >= 0; col--)
    {
        unsigned int sum = 0;
        for (int row = r; row >= 0; row--)
            sum += mat[row][col];
        temp.push_back(sum);
    }

    unsigned int i = 0;
    while (true)
    {
        unsigned int k = temp[i] % 10;
        unsigned int n = (temp[i] - k) / 10;
        if (i < mat_cols)
        {
            temp[i] = k;
            temp[i + 1] = temp[i + 1] + n;
        }
        else
        {
            temp[i] = k;
            temp.push_back(n);
        }
        if (temp[temp.size() - 1] < 10)
            break;
        i++;
    }

    std::string result = "";
    for (unsigned int i = 0; i <= 9; i++)
        result += std::to_string(temp[temp.size() - 1 - i]);

    return result;
}

int main(int argc, const char * argv[]) {
    std::string data = (std::string) argv[1];
    calc(makeData(data));
    return 0;
}
