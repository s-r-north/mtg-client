NAME := mtg-client

CC := g++
CFLAGS += -Wall -Wextra -Werror

SOURCE_DIR := src
BIN_DIR := obj

#BASIC_FUNC is meant to be a sample variable, to be deleted when actual files are in use

BASIC_FUNC +=	
BASIC_FUNC := $(addprefix $(SOURCE_DIR)/,$(BASIC_FUNC))
FUNC_BIN := $(addsuffix .o,$(BASIC_FUNC))

OBJ := $(addprefix $(BIN_DIR)/,$(FUNC_BIN)) #add add'l directories after the comma

INC := inc

$(BIN_DIR)/%.o: $(SOURCE_DIR)/%.c
	$(CC) $(CFLAGS) -I $(INC) -c $^ -o $@

.PHONY: clean fclean re

all: $(NAME)

$(NAME): $(OBJ)
    @echo "\n\033[32m[object files created ( ͡° ͜ʖ ͡°)]\033[0m"
    @$(CC) $(CFLAGS) -o $@ $^
	@echo "\033[32m[$(NAME) executable created ( ͡° ͜ʖ ͡°)]\033[0m"

$(OBJ): | $(BIN_DIR)

$(BIN_DIR):
	@mkdir -p $(addprefix $(BIN_DIR)/,$(FUNC_BIN))
	#add add'l directories after the comma

clean:
	@rm -rf $(BIN_DIR)
	@echo "\033[31m[object files deleted (╯°□°）╯︵ ┻━┻ ]\033[0m"

fclean: clean
	@rm -rf $(NAME)
	@echo "\033[31m[executable $(NAME) deleted ᕙ(⇀‸↼‶)ᕗ ]\033[0m"

re: fclean all