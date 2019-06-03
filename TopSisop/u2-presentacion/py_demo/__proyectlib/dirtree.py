#! /usr/bin/python3 -i

import os
import json
#from o_e_system import o_e_system as o_e_system

BLACKLIST=[
]

__ref = open("./__proyectlib/whitelist.json", "r")
WHITELIST=json.load(__ref)
__ref.close()


def is_in_blacklist(string):
    global BLACKLIST
    _blacklist = BLACKLIST
    
    for item in _blacklist:
        if item in string:
            return True
        else:
            pass

    return False

def is_in_whitelist(string):
    global WHITELIST
    _whitelist = WHITELIST
    
    for item in _whitelist:
        if item in string:
            return True
        else:
            pass

 

def clean_recursive_tree(current_dir):
    
    output = {}
    
    #Carpetas

    try:
        sub_dirs = os.popen("ls -d " + current_dir + "/*/ 2>/dev/null").read().split("\n")[:-1]
    except:
        pass 
    else:
        for ref_subdir in sub_dirs:
            temp_subdir = ref_subdir.replace(current_dir, "")[1:-1]
            # Primer Criterio : carpetas con nombres cortos
            if len(temp_subdir) < 20: 
                __temp = clean_recursive_tree(current_dir + "/" + temp_subdir)
                # Segundo Criterio : No Carpetas Vacias (aun en revision)
                if __temp == {}:
                    pass
                else:
                    output[temp_subdir + "/"] = __temp
            else:
                pass
    
    #Archivos

    try:
        sub_files = os.popen("ls -p " + current_dir  + " | grep -v / 2>/dev/null").read().split("\n")[:-1]
    except:
        pass
    else:
        for ref_subfile in sub_files: 
            #Criterio: Archivos con nombres cortos y de formatos permitidos (basicos, definidos en la lista blanca)
            if len(ref_subfile) < 20 and is_in_whitelist(ref_subfile):
                output[ref_subfile] = None
            else:
                pass

    return output

def __recursive_tree(current_dir):
    output = {}
    
    try:
        sub_dirs = os.popen("ls -d " + current_dir + "/*/ 2>/dev/null").read().split("\n")[:-1]
    except:
        pass 
    else:
        for ref_subdir in sub_dirs:
            temp_subdir = ref_subdir.replace(current_dir, "")[1:-1]
            output[temp_subdir + "/"] = __recursive_tree(current_dir + "/" + temp_subdir)
    
    try:
        sub_files = os.popen("ls -p " + current_dir  + " | grep -v / 2>/dev/null").read().split("\n")[:-1]
    except:
        pass
    else:
        for ref_subfiles in sub_files: 
            output[ref_subfiles] = None

    return output

def from_home_tree():
    home_root = os.popen('echo $HOME').read().strip()
    print(home_root) 

    return clean_recursive_tree(home_root)

