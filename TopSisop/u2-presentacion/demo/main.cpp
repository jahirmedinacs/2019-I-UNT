// #ifndef __MY_CLASS_H__
// #define __MY_CLASS_H__

#include <bits/stdc++.h>

#include <vector>
#include <list>
#include <string>

/*
 *
 *
 *
 *
 *
 */

#include <proyectlibs/dirtree.h>

// #endif

using namespace::std;


int main(void){
    list ref_ = gen_dir("./");
    list <string> :: iterator it;
    for(it=ref_.begin(); it!=ref_.end();++it){
        printf(">>>> %{}", *it);
    }
    return 0;
}
