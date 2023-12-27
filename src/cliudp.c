#include "biblio.h"
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    printf("Send message to server\n");
    emission("127.0.0.1", 8000, "Hello from client");
    return 0;
}
