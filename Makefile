# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aorcha-m <aorcha-m@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/08 16:37:43 by aorcha-m          #+#    #+#              #
#    Updated: 2024/04/22 16:48:23 by aorcha-m         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME        = fractol

SRCS_FRACTOL  = sources/main.c \
				sources/colors.c \
				sources/events.c \
				sources/mandelbrot.c \
				sources/julia.c \
				sources/burning_ship.c \
				sources/fractals.c

OBJS_FRACTOL = $(SRCS_FRACTOL:.c=.o)

MLX			= ${MLX_PATH}/libmlx42.a

MLX_PATH	= ./MLX42

LIBFT		= ${LIBFT_PATH}/libft.a

LIBFT_PATH	= ./libft

CC          = gcc
CFLAGS      = -Wall -Wextra -Werror -g
RM          = rm -f

FRAMEWORK	= -framework Cocoa -framework OpenGL -framework IOKit

GLFW		= -Iinclude -lglfw -L"/Users/aorcha-m/.brew/opt/glfw/lib/"

all: ${NAME}

${NAME}: ${OBJS_FRACTOL} ${LIBFT} ${MLX}
	@${CC} ${CFLAGS} ${OBJS_FRACTOL} ${LIBFT} ${MLX} ${GLFW} ${FRAMEWORK} -o ${NAME} 

${OBJS_FRACTOL}: %.o: %.c
	@${CC} ${CFLAGS} -I ${LIBFT_PATH} -c $< -o $@

${LIBFT}: 
	@make -C ${LIBFT_PATH} all

${MLX}: 
	@make -C ${MLX_PATH} all

clean:
	@${RM} ${OBJS_FRACTOL}
	@make -C ${LIBFT_PATH} clean
	@make -C ${MLX_PATH} clean

fclean: clean
	@${RM} ${NAME}
	@make -C ${LIBFT_PATH} fclean
	@make -C ${MLX_PATH} fclean

re: fclean all

.PHONY: all clean fclean re
