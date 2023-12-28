// Author: Jonny SAYKOSY
// CNAM 2023-2024

#include "biblio.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv)
{
    if (argc < 3) {
        printf("Usage: ./cliudp [HOST] [PORT] (MESSAGE)\n");
        printf("    Example: ./cliudp 127.0.0.1 8000 'Hello world'\n");
        return -1;
    }

    char* message = argc == 4 ? argv[3] : "Hello from cliudp !";
    printf("Sending message '%s' to server at %s:%s...\n", message, argv[1], argv[2]);
    emission(argv[1], atoi(argv[2]), message);
    return 0;
}
