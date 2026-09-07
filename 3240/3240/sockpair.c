#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/socket.h>

int main()
{
    int rc, status, sock[2];
    char buf[1000];

    socketpair(AF_UNIX,SOCK_STREAM,0,sock);
    printf("fds = %d %d\n",sock[0],sock[1]);
    rc = fork();
    printf("rc=%d\n",rc);
    if (rc > 0)
    {
        close(sock[1]);
	write(sock[0],"hello",6);
        buf[0] = '\0';
	read(sock[0],buf,6);
	printf("%d: recvd %s\n",getpid(),buf);
        close(sock[0]);
	rc = wait(&status);
        printf("status of child %d\n",status);
    }
    else
    {
        close(sock[0]);
        buf[0] = '\0';
	read(sock[1],buf,6);
	printf("%d: recvd %s\n",getpid(),buf);
        write(sock[1],"howdy",6);
        buf[0] = '\0';
	rc = read(sock[1],buf,6);
	printf("%d: recvd rc %d  buf %s\n",getpid(),rc,buf);
        return 0;
    }
}
