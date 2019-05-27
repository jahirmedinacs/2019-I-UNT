#include <bits/stdc++.h>

#include <list>
#include <system>

#include <list>
#include <string>

list gen_dir(string path_str){
    string  root_path="";
    root_path = concat("pwd ", path_str);
    string root_dir = system(root_path);
    
    list <string> output;
    output.push_back(root_dir);
    return output;
}

