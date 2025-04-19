# Name of the executable file
NAME		=	fart

# Files needed to build this project
SRC_FILES	=	main.c


# Location of the dependencies used
INC_DIR		=	.\inc
LIB_DIR		=	.\lib
SRC_DIR		=	.\src
OBJ_DIR		=	.\obj
TARGET_DIR	=	.\target

# C Compiler configuration
CC			=	gcc
CC_FLAGS	=	-Wall -Wextra -Werror

# Libraries and its location
LIBSDL		=	SDL2.dll
LIBMATHX	=	libmathx.a
SDL_DIR		=	$(LIB_DIR)\SDL
MATHX_DIR	=	$(LIB_DIR)\mathx
LIB_DIR_ALL	=	-L$(SDL_DIR)\lib -L$(MATHX_DIR)\lib
LIB_ALL		=	-lm -lmathx -lmingw32 -lSDL2main -lSDL2
INC_ALL		=	-I$(INC_DIR) -I$(SDL_DIR)\inc -I$(MATHX_DIR)\inc

# Apply path to source files and object ones
SRC			=	$(patsubst %.c, $(SRC_DIR)/%.c, $(SRC_FILES))
OBJ			=	$(patsubst %.c, $(OBJ_DIR)/%.o, $(SRC_FILES))

all:	$(SDL_DIR)\lib $(MATHX_DIR)\lib\$(LIBMATHX) $(TARGET_DIR)\$(NAME) $(TARGET_DIR)\$(LIBSDL)

$(TARGET_DIR)\$(NAME):	$(OBJ)
	@if not exist $(TARGET_DIR) mkdir $(TARGET_DIR)
	$(CC) $(CC_FLAGS) $^ $(LIB_DIR_ALL) $(LIB_ALL) -o $@

$(TARGET_DIR)\$(LIBSDL): $(SDL_DIR)\$(LIBSDL)
	@if not exist $(TARGET_DIR) mkdir $(TARGET_DIR)
	if not exist $(TARGET_DIR)\$(LIBSDL) copy $< $@

$(OBJ_DIR)/%.o:	$(SRC_DIR)\%.c
	@if not exist $(OBJ_DIR) mkdir $(OBJ_DIR)
	$(CC) $(CC_FLAGS) $(INC_ALL) -c $< -o $@

$(MATHX_DIR)\lib\$(LIBMATHX):
	@echo "Making libmathx . . ."
	@$(MAKE) -C $(MATHX_DIR) all
	@echo "libmathx is ready to use!"

clean:
	@echo "Cleaning libft . . ."
	@$(MAKE) -C $(FT_DIR) clean
	@echo "libft has been cleaned!"
	@echo "Cleaning libmathx . . ."
	@$(MAKE) -C $(MATHX_DIR) clean
	@echo "libmathx has been cleaned!"
	@echo "Removing object files [.obj] . . ."
	$(RM) -r $(OBJS_DIR)
	@echo "Object files were removed successfully!"

fclean:	clean
	@echo "Cleaning libmlx . . ."
	@$(MAKE) -C $(MLX_DIR) clean
	@echo "libmlx has been cleaned!"
	@echo "Full cleaning libft . . ."
	@$(MAKE) -C $(FT_DIR) fclean
	@echo "libft has been cleaned thoroughly!"
	@echo "Full cleaning libmathx . . ."
	@$(MAKE) -C $(MATHX_DIR) fclean
	@echo "libmathx has been cleaned thoroughly!"
	@echo "Removing $(NAME) . . ."
	$(RM) $(NAME)
	@echo "$(NAME) was removed successfully!"

re:	fclean all

.PHONY:	all clean fclean re

#		░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#		░░░░░░░░░░▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄░░░░░░░░░
#		░░░░░░░░▄▀░░░░░░░░░░░░▄░░░░░░░▀▄░░░░░░░
#		░░░░░░░░█░░▄░░░░▄░░░░░░░░░░░░░░█░░░░░░░
#		░░░░░░░░█░░░░░░░░░░░░▄█▄▄░░▄░░░█░▄▄▄░░░
#		░▄▄▄▄▄░░█░░░░░░▀░░░░▀█░░▀▄░░░░░█▀▀░██░░
#		░██▄▀██▄█░░░▄░░░░░░░██░░░░▀▀▀▀▀░░░░██░░
#		░░▀██▄▀██░░░░░░░░▀░██▀░░░░░░░░░░░░░▀██░
#		░░░░▀████░▀░░░░▄░░░██░░░▄█░░░░▄░▄█░░██░
#		░░░░░░░▀█░░░░▄░░░░░██░░░░▄░░░▄░░▄░░░██░
#		░░░░░░░▄█▄░░░░░░░░░░░▀▄░░▀▀▀▀▀▀▀▀░░▄▀░░
#		░░░░░░█▀▀█████████▀▀▀▀████████████▀░░░░
#		░░░░░░████▀░░███▀░░░░░░▀███░░▀██▀░░░░░░
#		░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░