//
//  main.cpp
//  Program Tester
//
//  Created by Sonni on 11/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <cstdio>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <string>
#include <vector>
#include <fstream>

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

std::vector<std::string> splitByChar(const std::string& str, int splitLength)
{
    int NumSubstrings = str.length() / splitLength;
    std::vector<std::string> ret;
    
    for (auto i = 0; i < NumSubstrings; i++)
    {
        ret.push_back(str.substr(i * splitLength, splitLength));
    }
    
    // If there are leftover characters, create a shorter item at the end.
    if (str.length() % splitLength != 0)
    {
        ret.push_back(str.substr(splitLength * NumSubstrings));
    }
    
    
    return ret;
}

float getTime(std::string out)
{
    std::vector<std::string> a = split(out, '\n');
    
    float finalTime;
    
    for (int i = 0; i < a.size(); i++)
    {
        
        int counter = 0;
        std::string timeKind = "";
        
        for(std::string::iterator it = a[i].begin(); it != a[i].end(); ++it) {
            timeKind += *it;
            counter++;
            if (counter == 3)
                break;
        }
        
        if (!timeKind.compare("use"))
        {
            std::string time = a[i].substr(5, a[i].length());
            
            std::string min = split(time, 'm')[0];
            
            std::string sec = split(time, 'm')[1];
            sec = sec.substr(0, sec.length() - 1);
            
            finalTime += std::stof(sec);
            finalTime += 60 * std::stof(min);
            
        }
        
        if (!timeKind.compare("sys"))
        {
            std::string time = a[i].substr(4, a[i].length());
            
            std::string min = split(time, 'm')[0];
            
            std::string sec = split(time, 'm')[1];
            sec = sec.substr(0, sec.length() - 1);
            
            finalTime += std::stof(sec);
            finalTime += 60 * std::stof(min);
        }
        
            
    }
    
    return finalTime;
}

std::string readOutput(std::string path)
{
    std::ifstream infile(path);
    std::string result;
    
    std::string line;
    while (std::getline(infile, line))
    {
        result += line + "\n";
    }
    infile.close();
    
    return result;
}

std::string exec(const char* cmd) {
    char buffer[128];
    std::string result = "";
    std::shared_ptr<FILE> pipe(popen(cmd, "r"), pclose);
    if (!pipe) throw std::runtime_error("popen() failed!");
    while (!feof(pipe.get())) {
        if (fgets(buffer, 128, pipe.get()) != NULL)
            result += buffer;
    }
    return result;
}



int main(int argc, const char * argv[]) {
    
    std::string out = exec("(time bash ./script.sh) 2> out.txt");
    
    std::string outString = readOutput("out.txt");
    
    float time = getTime(outString);
    
    std::cout << "Running time: " << time << " sec" << std::endl;
    
    return 0;
}
