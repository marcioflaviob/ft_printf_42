
SRCS += ft_printf.c
SRCS += ft_putchar.c
SRCS += ft_putnbr_base.c
SRCS += ft_putnbr.c
SRCS += ft_putstr.c
SRCS += ft_putunsnbr.c
SRCS += ft_putnbr_p.c

OBJS		= $(addprefix $(OBJDIR)/, $(SRCS:.c=.o))

OBJDIR		= objects

NAME		= libftprintf.a

INCLUDES	= ./

HEADER		= $(INCLUDES)ft_printf.h

CC			= cc

CFLAGS		+= -Wall
CFLAGS		+= -Wextra
CFLAGS		+= -Werror

all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $@ $^

$(OBJDIR):
				mkdir $@

$(OBJDIR)/%.o:	%.c
				$(CC) $(CFLAGS) -I $(INCLUDES) -c $< -o $@

$(OBJS):		$(HEADER) | $(OBJDIR)

clean:
				$(RM) -r $(OBJDIR)

fclean:			clean
				$(RM) $(NAME)

re:				fclean all

.PHONY:			all clean fclean re custom
