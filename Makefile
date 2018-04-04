# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ztisnes <ztisnes@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/25 17:50:25 by ztisnes           #+#    #+#              #
#    Updated: 2018/04/02 20:52:32 by ztisnes          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =		ft_printf/libftprintf.a
EXEC =		42sh

git:
	@echo "Adding to Github/Vogsphere"
	@git add .
	@echo "What is your message of your commit?"
	@read msg && git commit -m "$$msg"
	@echo "Pushing..."
	@git push
	@echo $(OK_COLOR) "all good :)" $(RESET_COLOR)

OBJ = $(SRC:.c=.o)
CC = gcc
FLAGS = -Wall -Wextra -Werror -g
RM = rm -rf
LFT = -C libft/
GREEN = \033[92m
PURPLE = \033[095m
YELLOW = \033[093m
NORM = \033[0m
ERASE = \033[K
CURSORUP = \033[1A

all: $(NAME)
$(NAME): $(OBJ)
	@echo "$(ERASE)$(PURPLE)[42sh] :$(NORM) $(GREEN)Creating Library$(NORM) $(CURSORUP)";
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)
	@$(CC) $(FLAGS) main.c $(NAME) -o $(EXEC)
	@echo "$(ERASE)$(PURPLE)[42sh] :$(NORM) $(GREEN)42sh Compiled!$(NORM)";
%.o: %.c
	@$(CC) $(FLAGS) -c $< -o $@
	@echo "$(ERASE)$(YELLOW)[PRINTF] :$(NORM) $(GREEN)Building Printf...$(NORM) $(CURSORUP)";
	@cd ft_printf && make re
	@echo "$(ERASE)$(PURPLE)[42sh] :$(NORM) $(GREEN)Compiling $<$(NORM) $(CURSORUP)";
clean:
	@$(RM) $(OBJ)
	@cd libft && make clean
	@echo "$(ERASE)$(PURPLE)[42sh] :$(NORM) $(GREEN)Cleaning Object files $(NORM)";
fclean: clean
	@$(RM) $(NAME)
	@echo "$(ERASE)$(PURPLE)[42sh] :$(NORM) $(GREEN)Cleaning 42sh $(NORM)";
re: fclean all
