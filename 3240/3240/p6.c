#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>
#include <string.h>
 
int main(int argc, char *argv[]) {
    
    if(strcmp(argv[1], "-hw") == 0)
    {
        printf("hello world");
        exit(0);
    }
    
    void *handle;
    char *error;
    void (*passingFucn)(char *, int);

    handle = dlopen("/nfshome/rbutler/public/courses/cs/p6testfiles/libp6.so", RTLD_LAZY);
    passingFucn = dlsym(handle, argv[1]);
    if (!handle) 
    { 
    fprintf(stderr, "dlopen failed: %s\n", dlerror()); 
    exit(EXIT_FAILURE); 
    };
    
    if (!passingFucn) 
    { fprintf(stderr, "dlsym failed: %s\n", dlerror());
    exit(EXIT_FAILURE); 
    };

    passingFucn(argv[2], atoi(argv[3]));
    dlclose (handle);

  return 0;
}
