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
#include <math.h>
#include <algorithm>

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
    
    float finalTime = 0.0;
    
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
            
            finalTime += std::stof(time);
            
        }
        
        if (!timeKind.compare("sys"))
        {
            std::string time = a[i].substr(4, a[i].length());
            
            finalTime += std::stof(time);
           
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

bool doTest(std::string title, const char* command, unsigned int loopCount, unsigned int maxTime)
{
    float sum = 0.0;
    std::vector<float> results;
    bool shouldBreak = false;
    std::cout << title << "" << std::endl;
    for (int i = 0; i < loopCount; i++)
    {
        //std::string out = exec(command);
        system(command);
        
        std::string outString = readOutput("out.txt");
        float time = getTime(outString);
        sum += time;
        results.push_back(time);
        
        std::cout << time << std::endl;
        if (time >= 60*maxTime)
        {
            shouldBreak = true;
            break;
        }
    }
    
    std::sort(results.begin(), results.end());
    float median = results[results.size()/2];
    
    std::cout << "Average time is: " << sum / loopCount << " : Median is: " << median << std::endl;
    std::cout << "____________________________________" << std::endl;
    return shouldBreak;
}


int main(int argc, const char * argv[])
{
    
    std::ifstream infile("script.sh");
    int counter = 0;
    std::string line;
    bool shouldBreak = false;
    std::string oldLang = "";
    
    while (std::getline(infile, line))
    {
        
        std::string language = split(line, ' ')[0];
        std::string programName = split(line, ' ')[1];
        std::string arguments = "";
        if (oldLang == "")
            oldLang = language;
        
        if (oldLang == language && shouldBreak)
        {
            continue;
        }
        else
        {
            oldLang = language;
            shouldBreak = false;
        }
        
        if (!language.compare("/Applications/Julia-0.4.5.app/Contents/Resources/julia/bin/julia"))
            language = "Julia";
        
        if (language[0] == '.' && language[1] == '/')
        {
            language = "C++";
            programName = split(line, ' ')[0];
            std::vector<std::string> arg = split(line, ' ');
            for (unsigned int i = 1; i < arg.size(); i++)
                arguments += arg[i] + " ";
        }
        else
        {
            std::vector<std::string> arg = split(line, ' ');
            for (unsigned int i = 2; i < arg.size(); i++)
                arguments += arg[i] + " ";
        }
        
        
        
        
        
        
        std::string command = "(time -p " + line + ") 2> out.txt";
        
        shouldBreak = doTest(language + " : " + programName + " " + arguments, command.c_str(), atoi(argv[1]), atoi(argv[2]));
        counter++;
    }
    infile.close();
    
    return 0;
}
