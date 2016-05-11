//
//  main.cpp
//  Euler 11
//
//  Created by Sonni on 08/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <sstream>
#include <string>
#include <fstream>
#include <vector>

std::vector<int> split_string_to_ints(std::string s, char delim)
{
    std::vector<int> elems;
    
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

std::vector<std::vector<int>> load_mat_to_vector()
{
    std::ifstream infile("20xgrid.txt");
    std::vector<std::vector<int>> mat;
    
    std::string line;
    while (std::getline(infile, line))
        mat.push_back(split_string_to_ints(line, ' '));
    infile.close();
    
    return mat;
}

int** load_mat_to_multi_array()
{
    int** a = 0;
    a = new int*[20];
    
    std::ifstream infile("20xgrid.txt");
    std::vector<std::vector<int>> mat;
    
    std::string line;
    int counter = 0;
    while (std::getline(infile, line))
    {
        a[counter] = new int[20];
        std::vector<int> tmpArray = split_string_to_ints(line, ' ');
        for (int i = 0; i < tmpArray.size(); i++)
            a[counter][i] = tmpArray[i];
        counter++;
    }
    infile.close();
    
    return a;
}

int main(int argc, const char * argv[])
{
   // int** mat = load_mat_to_multi_array();
    std::vector<std::vector<int>> mat = load_mat_to_vector();
    
    int maxProd = 0;
    const int matLength = 20;
    const int numProd = 4;
    
    for (int i = 0; i < matLength; i++)
    {
        for (int j = 0; j < matLength - numProd + 1; j++)
        {
            //right/left
            int prod = 1;
            for (int k = 0; k < numProd; k++)
                prod *= mat[i][j + k];
                
            if (prod > maxProd)
                maxProd = prod;
            
            //up/down
            prod = 1;
            for (int k = 0; k < numProd; k++)
                prod *= mat[j + k][i];
            
            if (prod > maxProd)
                maxProd = prod;
        }
    }
    
    //diagonal left->right
    for (int i = 0; i < matLength - numProd + 1; i++)
    {
        for (int j = 0; j < matLength - numProd + 1; j++)
        {
            int prod = 1;
            for (int k = 0; k < numProd; k++)
                prod *= mat[i + k][j + k];
                
            if (prod > maxProd)
                maxProd = prod;
        }
    }
    
    //diagonal right->left
    for (int i = 0; i < matLength - numProd + 1; i++)
    {
        for (int j = matLength-1; j >= numProd; j--)
        {
            int prod = 1;
            for (int k = 0; k < numProd; k++)
                prod *= mat[i + k][j - k];
                
            if (prod > maxProd)
                maxProd = prod;
        }
    }
    
    std::cout << maxProd << std::endl;
    
    return 0;
}

