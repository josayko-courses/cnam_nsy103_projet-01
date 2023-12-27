# Executable name
SERVER = srvudp
CLIENT = cliudp

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra -Werror

# Source files
SRCDIR = src/
SRC = srvudp.c \
			cliudp.c

# Lib
LIB = lib/biblio.a

# Includes
INC = -Ilib

# *.o files
OBJDIR = obj/
OBJ = $(addprefix $(OBJDIR),$(SRC:.c=.o))

all: $(SERVER) $(CLIENT)

# Make the executable `project-01`
$(SERVER): $(OBJDIR) $(OBJ)
	make -C lib/ 1>/dev/null
	$(CC) $(addprefix $(OBJDIR),srvudp.o) $(INC) $(LIB) -o $(SERVER)

# Create an obj/ directory for the *.o files
$(OBJDIR):
	mkdir -p $@

# Compile the *.o files
$(OBJDIR)%.o: $(SRCDIR)%.c
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

$(CLIENT): $(SERVER)
	$(CC) $(addprefix $(OBJDIR),cliudp.o) $(INC) $(LIB) -o $(CLIENT)

clean:
	rm -rf $(OBJDIR)
	make clean -C lib/ 1>/dev/null

fclean: clean
	rm -rf $(SERVER) $(CLIENT)
	make fclean -C lib/ 1>/dev/null

re: fclean all
