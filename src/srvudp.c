#include "biblio.h"
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void stopped()
{
    printf("\nServer stopped...\n");
    exit(0);
}

int main(int argc, char** argv)
{
    if (argc != 2) {
        printf("Usage: ./srvudp [PORT]\n");
        return -1;
    }

    signal(SIGINT, stopped);
    int port = atoi(argv[1]);
    printf("Server listening on port %d...\n", port);

    char buffer[1024];
    memset(&buffer, 0, sizeof(buffer));

    int ret = 0;
    while ((ret = reception(port, buffer)) >= 0) {
        printf("Message received: %s\n", buffer);
    }
    return 0;
}
