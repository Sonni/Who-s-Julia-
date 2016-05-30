//
//  main.cpp
//  root compiler
//
//  Created by Sonni on 30/05/16.
//  Copyright © 2016 Sonni Jensen. All rights reserved.
//

#include <iostream>
#include <dirent.h>

int main(int argc, const char * argv[]) {
    const char* PATH = ".";
    
    DIR *dir = opendir(PATH);
    
    struct dirent *entry = readdir(dir);
    
    while (entry != NULL)
    {
        if (entry->d_type == DT_DIR)
        if (std::strcmp(entry->d_name, ".") && std::strcmp(entry->d_name, ".."))
        {
            std::string name = (std::string) entry->d_name;
            std::string command = "javac " + name + "/" + name + ".java";
            system(command.c_str());
            
            command = "make " + name + "/" + name;
            system(command.c_str());
        }
        
        entry = readdir(dir);
    }
    
    closedir(dir);
    
    return 0;
}
