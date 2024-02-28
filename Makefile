NAME = libft.a

#----COLORS----#
DEF_COLOR = \033[1;39m
GREEN = \033[1;32m
PINK = \033[1;35m
CIAN = \033[1;36m
BLUE = \033[1;34m

#----COMPILER----#
CC = cc
CFLAGS = -Wall -Wextra -Werror

#----LIB LINKER----#
AR = ar
ARFLAGS = rcs

#----DIRS----#
BINDIR = bin

#----MANDATORY----#
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
		get_next_line.c \
		get_next_line_utils.c \
		ft_printf.c \
		ft_printf_parses.c \
		ft_printf_complex_parses.c \
		ft_printf_padding_helper.c \
		ft_printf_complex_padding_helper.c \
		ft_printf_format_helper.c \
		ft_printf_flags_utils.c \
		number_utils.c
OBJS = $(SRCS:%.c=$(BINDIR)/%.o)
DEPS = $(SRCS:%.c=%.d)

#----BONUS----#
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

#----TARGETS----#
all: $(NAME)

ifndef BONUS
$(NAME): $(OBJS)
	@echo "$(BLUE)\nLinking objects and creating static library...$(DEF_COLOR)"
	@$(AR) $(ARFLAGS) $(NAME) $(OBJS)
	@echo "$(GREEN)[✓]LIBFT CREATED!!!$(DEF_COLOR)"
else
$(NAME): $(OBJS) $(BOBJS)
	@echo "$(BLUE)\nLinking objects and creating static library...$(DEF_COLOR)"
	@$(AR) $(ARFLAGS) $(NAME) $(OBJS) $(BOBJS)
	@echo "$(GREEN)[✓]LIBFT vBONUS CREATED!!!$(DEF_COLOR)"
endif
$(BINDIR)/%.o: %.c Makefile
	@mkdir -p $(BINDIR)
	@echo "$(CIAN)Compiling object for $(PINK)$<$(DEF_COLOR)"
	@$(CC) $(CFLAGS) -MMD -c $< -o $@

clean:
	@rm -rf $(BINDIR)

fclean:	clean
	@rm -f $(NAME)

re: fclean all

bonus:
	@$(MAKE) --no-print-directory BONUS=1

.PHONY: all clean fclean re bonus

-include $(DEPS)

-include $(BDEPS)
