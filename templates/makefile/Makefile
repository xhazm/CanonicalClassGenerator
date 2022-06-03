# Program Name
NAME = main

# Compiler & Flags
CC = c++
FLAGS = -Wall -Werror -Wextra -std=c++98

#SRC & OBJS
SRC_FILES = ClassName
OBJ_FILES = $(patsubst %.cpp,%.o,$(SRC_FILES))
OBJ_DIR = ./obj/
SRC_DIR = ./src/
SRC = $(addprefix $(SRC_DIR), $(SRC_FILES)) 
OBJ = $(addprefix $(OBJ_DIR), $(OBJ_FILES)) 

# All rule
all: obj $(NAME)

# Creating OBJ Folder
obj:
	mkdir -p $(OBJ_DIR)

# Compiling
$(NAME): $(OBJ)
	$(CC) $(FLAGS) $(OBJ) -o $(NAME)

$(OBJ_DIR)%.o: $(SRC_DIR)%.cpp
	$(CC) $(FLAGS) -c $< -o $@

# Rules
clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -rf $(NAME)

re: fclean all
