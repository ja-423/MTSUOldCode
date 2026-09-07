#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>

 int  main(int argc, char *argv[])
{
       if  (strcmp(argv[1],"-hw")==0)
    {
        printf("hello world \n");
        exit(0);
    }
    int i;
    int rc;
    int stdout_pipe_fds[2];
    char buf[1000];
    char *nl_args[] = {"nl","-s",": ",NULL};

    pipe(stdout_pipe_fds);
    if ( (rc = fork())  == -1)
    {
        printf("fork failed\n");
        exit(-1);
    }
    else if (rc == 0)  // child
    {
        alarm(90);
        close(stdout_pipe_fds[0]);
        dup2(stdout_pipe_fds[1],STDOUT_FILENO);
        close(stdout_pipe_fds[1]);
        argv[0] = "/usr/bin/shuf";
        execve(argv[0],argv,NULL);
        perror("exec failed");
        exit(-1);
    }
    // parent
        alarm(90);
    // parent gets here and handles " nl -s ": "
    // replace standard output with output part of pipe
        dup2(stdout_pipe_fds[0],STDIN_FILENO);   
        close(stdout_pipe_fds[0]); 
        close(stdout_pipe_fds[1]);
        execve("/usr/bin/nl",nl_args,NULL); 
        // running this will complete the whole command : shuf argv | nl -s ": " and gets you the correct output
        //close(stdout_pipe_fds[1]); 
        perror("exec failed");
        exit(-1);       
        }