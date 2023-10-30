# Executable name
EXEC = srvudp

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra -Werror

# Source files
SRCDIR = src/
SRC = srvudp.c

# Lib
LIB = lib/biblio.a

# Includes
INC = -I.

# *.o files
OBJDIR = obj/
OBJ = $(addprefix $(OBJDIR),$(SRC:.c=.o))

all: $(EXEC)

# Make the executable `project-01`
$(EXEC): $(OBJDIR) $(OBJ)
	make -C lib/ 1>/dev/null
	$(CC) $(OBJ) $(INC) $(LIB) -o $(EXEC)

# Create an obj/ directory for the *.o files
$(OBJDIR):
	mkdir -p $@

# Compile the *.o files
$(OBJDIR)%.o: $(SRCDIR)%.c
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

clean:
	rm -rf $(OBJDIR)
	make clean -C lib/ 1>/dev/null

fclean: clean
	rm -rf $(EXEC)
	make fclean -C lib/ 1>/dev/null

re: clean fclean
