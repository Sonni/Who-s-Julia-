//
//  main.cpp
//  quicksort
//
//  Created by Sonni on 08/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <fstream>
#include <vector>

void swap(int a[], int i, int j)
{
    const int tmp = a[i];
    a[i] = a[j];
    a[j] = tmp;
}

void quicksort(int a[], int s, int e)
{
    if (s < e)
    {
        const int pivot = a[e];
        int pointer = s;
        for (int i = s; i < e; i++)
        {
            if (a[i] <= pivot)
            {
                swap(a, pointer, i);
                pointer++;
            }
        }
        swap(a, pointer, e);
        
        quicksort(a, s, pointer - 1);
        quicksort(a, pointer, e);
    }
}

void quicksortDualPivot(int a[], int s, int e) {
    if (e > s)
    {
        //use start and end elements as pivots (a[s] must be smaller than a[e])
        if (a[s] > a[e])
        swap(a, s, e);
        
        const int leftPiv = a[s];
        const int rightPiv = a[e];
        
        // leftPiv < ]leftPoi;rightPoi[ < righPiv
        int leftPoi = s + 1;
        int rightPoi = e - 1;
        
        int curEle = leftPoi; //curEle is the current element we're looking at
        
        while (curEle <= rightPoi)
        {
            if (a[curEle] < leftPiv)
            {
                swap(a, curEle, leftPoi);
                leftPoi++;
            }
            else if (a[curEle] >= rightPiv)
            {
                while (a[rightPoi] > rightPiv && curEle < rightPoi)
                rightPoi--;
                
                swap(a, curEle, rightPoi);
                rightPoi--;
                if (a[curEle] < leftPiv)
                {
                    swap(a, curEle, leftPoi);
                    leftPoi++;
                }
            }
            curEle++;
        }
        leftPoi--;
        rightPoi++;
        
        //swap the pivots
        swap(a, s, leftPoi);
        swap(a, e, rightPoi);
        
        quicksortDualPivot(a, s, leftPoi - 1);
        quicksortDualPivot(a, leftPoi + 1, rightPoi - 1);
        quicksortDualPivot(a, rightPoi + 1, e);
    }
}

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

int main(int argc, const char * argv[])
{
    
    
    std::ifstream infile(argv[2]);
    
    std::string line;
    std::getline(infile, line);
    
    std::vector<std::string> v = split(line, ' ');
    const int size = v.size();
    int a[size];
    
    for (int i = 0; i < v.size(); i++)
    a[i] = std::stoi(v[i]);
    
    infile.close();
    
    
    if (!strcmp(argv[1], "quicksort"))
    quicksort(a, 0, v.size());
    
    if (!strcmp(argv[1], "dualquicksort"))
    quicksortDualPivot(a, 0, v.size());
    
    //for (int i = 0; i < v.size(); i++)
    // std::cout << a[i] << " ";
    
    
    return 0;
}