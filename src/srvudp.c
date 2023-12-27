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

int main(void)
{
    signal(SIGINT, stopped);
    printf("Server listening on 127.0.0.1:%d...\n", 8000);
    char buffer[50];
    memset(&buffer, 0, sizeof(buffer));
    while (1) {
        reception(8000, buffer);
        printf("%s\n", buffer);
    }
    return 0;
}
