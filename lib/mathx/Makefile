NAME		=	libmathx.a

SRC_FILES	=	mx_tuple.c		\
				mx_point.c		\
				mx_vector.c		\
				mx_equal.c		\
				mx_equalxyz.c	\
				mx_equalt.c		\
				mx_negate.c		\
				mx_sum.c		\
				mx_sub.c		\
				mx_prod.c		\
				mx_div.c		\
				mx_length.c		\
				mx_unit.c		\
				mx_to_unit.c	\
				mx_dot.c		\
				mx_cross.c		\
				mx_matrix.c		\
				mx_equalm.c		\
				mx_multiply.c	\
				mx_transform.c	\
				mx_identity.c	\
				mx_transpose.c	\
				mx_submatrix.c	\
				mx_det.c		\
				mx_minor.c		\
				mx_cofactor.c	\
				mx_inv.c		\
				mx_translate.c	\
				mx_scale.c		\
				mx_rotate.c		\
				mx_rotated.c	\
				mx_skew.c		\
				mx_viewtransf.c

INC_DIR		=	.\inc
LIB_DIR		=	.\lib
SRC_DIR		=	.\src
OBJ_DIR		=	.\obj

CC			=	gcc
CC_FLAGS	=	-Wall -Wextra -Werror

INC			=	-I$(INC_DIR)
LIB			=	-lm

SRC			=	$(patsubst %.c, $(SRC_DIR)/%.c, $(SRC_FILES))
OBJ			=	$(patsubst %.c, $(OBJ_DIR)/%.o, $(SRC_FILES))

all:	$(LIB_DIR)\$(NAME)

$(LIB_DIR)\$(NAME):	$(OBJ)
	@if not exist $(LIB_DIR) mkdir $(LIB_DIR)
	@ar rcs $@ $^
	@ranlib $@

$(OBJ_DIR)/%.o:	$(SRC_DIR)\%.c
	@if not exist $(OBJ_DIR) mkdir $(OBJ_DIR)
	@$(CC) $(CC_FLAGS) $(INC) -c $< -o $@

clean:
	@if exist $(OBJ_DIR) rd /s /q $(OBJ_DIR)

fclean:	clean
	@if exist $(LIB_DIR) rd /s /q $(LIB_DIR)

re:	fclean all

test: main.c all
	$(CC) $(INC) -c $< -o main.o
	@$(CC) main.o $(OBJ) -o test $(LIB)
	@del /q main.o
	.\test
	@del /q test.exe

.PHONY:	all clean fclean re test
