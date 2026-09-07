#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string>
#include <stdio.h>
#include <string.h>

int main(int argc, char** argv)
{
    int i, rc;
    int stdout_pipe_fds[2];
    char buf[1000];
    char *nl_args[] = {"nl","-s",": ",NULL};
    alarm(90);
    char* token = strtok(buf, "\n");

    if (std::string(argv[1]) == "-hw")
    {
        printf("hello world");
        exit(0);
    }

    pipe(stdout_pipe_fds);
    if ((rc = fork()) == -1)
    {
        printf("fork failed\n");
        exit(-1);
    }
    else if (rc == 0)
    {
        alarm(90);
        close(stdout_pipe_fds[0]);

        dup2(stdout_pipe_fds[1], STDOUT_FILENO);
        close(stdout_pipe_fds[1]);

        argv[0] = "/usr/bin/shuf";
        execve(argv[0],argv,NULL);

        perror("exec failed");
        exit(-1);
    }
        alarm(90);
        dup2(stdout_pipe_fds[0],STDIN_FILENO);  

        close(stdout_pipe_fds[0]); 
        close(stdout_pipe_fds[1]);
        execve("/usr/bin/nl",nl_args,NULL); 

        perror("exec failed");
        exit(-1);
}
