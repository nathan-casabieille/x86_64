##
## EPITECH PROJECT, 2021
## my_ftp
## File description:
## Makefile for unit tests
##

NAME	=	tests

IDIR	=	../include/

CC	=	gcc

CFLAGS	+=	-I $(IDIR)
CFLAGS	+=	-W -Wall -Wextra
CFLAGS	+=	-Wpedantic -Wno-long-long


SRCS_DIR	=	./
SRCS_FILES	=	tests.c

SRCS	=	$(addprefix $(SRCS_DIR), $(SRCS_FILES))

OBJS	=	$(SRCS:.c=.o)

all:	$(OBJS)
	$(CC) -o $(NAME) ../libasm.so $(OBJS) -lcriterion

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re:	fclean all

.PHONY: all clean fclean re
