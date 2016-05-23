
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
#include <string>

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

std::vector<std::vector<unsigned int>> load_mat_to_vector(std::string path)
{
    std::ifstream infile(path);
    std::vector<std::vector<unsigned int>> mat;
    
    std::string line;
    while (std::getline(infile, line))
        mat.push_back(split_string_to_ints(line, ' '));
    infile.close();
    
    return mat;
}

int** load_mat_to_multi_array(std::string path, int matLength)
{
    int** a = 0;
    a = new int*[matLength];
    
    std::ifstream infile(path);
    std::vector<std::vector<int>> mat;
    
    std::string line;
    int counter = 0;
    while (std::getline(infile, line))
    {
        a[counter] = new int[matLength];
        std::vector<unsigned int> tmpArray = split_string_to_ints(line, ' ');
        for (int i = 0; i < tmpArray.size(); i++)
            a[counter][i] = tmpArray[i];
        counter++;
    }
    infile.close();
    
    return a;
}

int main(int argc, const char * argv[])
{
    unsigned int maxProd = 0;
    const int matLength = 20;//atoi(argv[1]);
    const int numProd = 4;//atoi(argv[2]);
    
    int** mat = load_mat_to_multi_array("mat" + std::to_string(matLength) + ".txt", matLength);
    //std::vector<std::vector<int>> mat = load_mat_to_vector("mat" + std::to_string(matLength) + ".txt");
    
    
    for (unsigned int i = 0; i < matLength; i++)
    {
        for (unsigned int j = 0; j < matLength - numProd + 1; j++)
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
    for (unsigned int i = 0; i < matLength - numProd + 1; i++)
    {
        for (unsigned int j = matLength-1; j >= numProd; j--)
        {
            unsigned int prod = 1;
            for (unsigned int k = 0; k < numProd; k++)
                prod *= mat[i + k][j - k];
            
            if (prod > maxProd)
                maxProd = prod;
        }
    }
    
    std::cout << maxProd << std::endl;
    
    return 0;
}



