NAME = libasm_i386.a
ASM = nasm

LIBDIR	= ./
SRCDIR	= srcs
OBJDIR	= objs

ASMFLAGS = -f elf

SRC = sse2_memcpy

TMP = $(basename $(notdir $(SRC)))
OBJ = $(addprefix $(OBJDIR)/, $(addsuffix .o, $(TMP)))

.PHONY: all re clean fclean help

all: $(NAME)

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)

$(OBJDIR)/%.o: $(SRCDIR)/%.asm includes/libasm_i386.h
	$(ASM) $(ASMFLAGS) -o $@ $<

clean:
	rm -vf $(OBJ)

fclean:
	rm -vf $(OBJ)
	rm -vf $(NAME)

re: fclean all

help:
	@echo
	@echo "Librairy $(NAME)"
	@echo
	@echo "--------------------------------------------------------------------------"
	@echo " Disp rules."
	@echo
	@echo " all     : Compile the librairy if a file has changed, stored in $(LIBDIR)."
	@echo " re      : Recompile all objets of the librairy."
	@echo " clean   : Remove objects."
	@echo " fclean  : Remove objects and executable."
	@echo " help    : Display this."
	@echo "--------------------------------------------------------------------------"
	@echo
