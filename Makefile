NAME = libft.a

CC = cc
CFLAGS = -Wall -Wextra -Werror

AR = ar
ARFLAGS = rcs

BINDIR = bin

SRCS = ft_isdigit.c \
		ft_atoi.c \
		ft_bzero.c \
		ft_calloc.c \
		ft_isalnum.c \
		ft_isalpha.c \
		ft_isascii.c \
		ft_isdigit.c \
		ft_isprint.c \
		ft_itoa.c \
		ft_memchr.c \
		ft_memcmp.c \
		ft_memcpy.c \
		ft_memmove.c \
		ft_memset.c \
		ft_putchar_fd.c \
		ft_putendl_fd.c \
		ft_putnbr_fd.c \
		ft_putstr_fd.c \
		ft_split.c \
		ft_strchr.c \
		ft_strdup.c \
		ft_striteri.c \
		ft_strjoin.c \
		ft_strlcat.c \
		ft_strlcpy.c \
		ft_strlen.c \
		ft_strmapi.c \
		ft_strncmp.c \
		ft_strnstr.c \
		ft_strrchr.c \
		ft_strtrim.c \
		ft_substr.c \
		ft_tolower.c \
		ft_toupper.c \
		ft_putchar.c \
		ft_putstr.c \
		ft_putnbr.c \
		get_next_line_bonus.c \
		get_next_line_utils_bonus.c
OBJS = $(SRCS:%.c=$(BINDIR)/%.o)
DEPS = $(SRCS:%.c=%.d)

BSRCS = ft_lstadd_back_bonus.c \
		ft_lstadd_front_bonus.c \
		ft_lstclear_bonus.c \
		ft_lstdelone_bonus.c \
		ft_lstiter_bonus.c \
		ft_lstlast_bonus.c \
		ft_lstmap_bonus.c \
		ft_lstnew_bonus.c \
		ft_lstsize_bonus.c
BOBJS = $(BSRCS:%.c=$(BINDIR)/%.o)
BDEPS = $(BSRCS:%.c=%.d)


all: $(NAME)

$(NAME): $(OBJS)
	@echo "Linking objects and creating static library"
	@$(AR) $(ARFLAGS) $(NAME) $(OBJS)
	@echo "LIBFT CREATED!!!"

$(BINDIR)/%.o: %.c Makefile
	@mkdir -p $(BINDIR)
	@echo "Compiling object"
	@$(CC) $(CFLAGS) -MMD -c $< -o $@

clean:
	@rm -rf $(BINDIR)

fclean:	clean
	@rm -f $(NAME)

re: fclean all

$(BINDIR)/.bonus: $(NAME) $(BOBJS)
	@echo "Linking objects and creating static library with BONUS"
	@$(AR) $(ARFLAGS) $(NAME) $(OBJS) $(BOBJS)
	@touch $(BINDIR)/.bonus
	@echo "LIBFT vBONUS CREATED!!!"

bonus: $(BINDIR)/.bonus

.PHONY: all clean fclean re bonus

-include $(DEPS)

-include $(BDEPS)
