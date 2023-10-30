LIB = biblio.a

SRC = biblio.c
OBJ = $(SRC:.c=.o)

all: $(LIB)

$(LIB): $(OBJ)
	ar rc $(LIB) $(OBJ)
	ranlib $(LIB)

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(LIB)

re: fclean all

