##
## EPITECH PROJECT, 2020
## Nathan Casabieille
## File description:
## Makefile for asm minilibc
##

AS	=	nasm

CC	=	gcc

RM	=	rm -f

ASFLAGS	=	-f elf64

NAME	=	libasm.so

SRCS_DIR	=	src/
SRCS_FILES	=	putstr.asm			\
							strcasecmp.asm	\
							strchr.asm			\
							strcmp.asm			\
							strlen.asm			\
							strncmp.asm			\
							strstr.asm			\
							strtolower.asm	\
							strtoupper.asm	\
							write.asm

SRCS	=	$(addprefix $(SRCS_DIR), $(SRCS_FILES))

OBJS	=	$(SRCS:.asm=.o)

all:		$(NAME)

$(NAME):	$(OBJS)
		$(CC) -nostdlib -shared -fPIC $(OBJS) -o $(NAME)

%.o : %.asm
		$(AS) $(ASFLAGS) -o $@ $<

clean:
		$(RM) $(OBJS)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

.PHONY:		all clean fclean re
