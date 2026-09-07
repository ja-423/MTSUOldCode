
#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>
#include <string.h>
 
int main(int argc, char *argv[]) {
typedef void (func_sig_t)(char*, int*);
func_sig_t* funcptr;
void *handle;
handle = dlopen("./libp6.so", RTLD_LAZY);
if (!handle) 
  { 
    fprintf(stderr, "dlopen failed: %s\n", dlerror()); 
    exit(EXIT_FAILURE); 
  };
funcptr = (func_sig_t*) dlsym(handle, argv[1]);
if (!funcptr) 
  { fprintf(stderr, "dlsym failed: %s\n", dlerror());
    exit(EXIT_FAILURE); 
  };
dlclose (handle);
funcptr = NULL;

  return 0;
}