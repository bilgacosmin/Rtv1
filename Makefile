NAME = rtv1

HEADER 	= $(shell find includes -type f 2>/dev/null) $(shell find libraries/include -type f 2>/dev/null || true)

OBJ = $(addprefix obj/, $(SRC:%.c=%.o))

SRC_PATH = $(shell find src -type d)

INC_PATH = $(shell find includes -type d) $(shell find libraries/include -type d)

LIB_PATH = ./libraries/lib \

GCC = gcc -Wall -Wextra -Werror

SRC = 	vector.c \
		vector_2.c \
		free_win.c \
		init_win.c \
		turn.c \
		key_events.c \
		draw.c \
		camera.c \
		raytracer.c \
		sphere.c \
		color.c \
		plane.c \
		cone.c \
		aux.c \
		cylinder.c \
		parsing.c \
		parse_sphere.c \
		parse_cone.c \
		parse_plane.c \
		parse_cylinder.c \
		parse_light.c \
		parse_camera.c \
		obj_translate.c \
		obj_rotate.c \
		main.c

IFLAG = $(foreach dir, $(INC_PATH), -I$(dir) )

LFLAG = -L ./libraries/lib \
		-lSDL2 \
		-L ./Libft \
		-lft

all: $(NAME)

$(NAME): libraries/lib/libSDL2.dylib Libft/libft.a $(OBJ)
	gcc -o $(NAME) $(OBJ) $(LFLAG)
	@echo "Done !"

obj/%.o: $(SRC_PATH)/%.c $(HEADER)
	@mkdir -p obj
	$(GCC) -o $@ -c $< $(IFLAG)


Libft/libft.a:
	@make -C ./Libft/

libraries/lib/libSDL2.dylib:
	@echo "Compiling SDL, please wait.."
	@mkdir -p libraries
	@curl -s https://www.libsdl.org/release/SDL2-2.0.8.tar.gz -o libraries/SDL2-2.0.8.tar.gz >> /dev/null 2>&1
	@tar -xf libraries/SDL2-2.0.8.tar.gz -C libraries >> /dev/null 2>&1
	@cd libraries/SDL2-2.0.8 ; ./configure --prefix=$(shell pwd)/libraries >> /dev/null 2>&1
	@make -C ./libraries/SDL2-2.0.8 >> /dev/null 2>&1
	@make -C ./libraries/SDL2-2.0.8 install >> /dev/null 2>&1

clean:
	rm -Rf obj

fclean: clean
	rm -rf rtv1
	rm -rf Libft/*.o
	rm -rf Libft/libft.a

re: fclean all

.PHONY: fclean re
