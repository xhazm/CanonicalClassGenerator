CC = c++
FLAGS = -Wall -Werror -Wextra -std=c++98
NAME = main
SRC = ClassName
OBJ = $(patsubst %.cpp,%.o,$(SRC))

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(FLAGS) $(OBJ) -o $(NAME)

%.o: %.cpp
	$(CC) $(FLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re: fclean all