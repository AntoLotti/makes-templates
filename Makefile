#============NAMES INFO===============#
TEST_NAME	:=	test_exce		#Testing 	executable name
DEBG_NAME	:=	debg_exce		#Debuging 	executable name
FINAL_NAME	:=	final_exce		#Final 		executable name
DEF_NAME	=	exe

#============TOOL MACROS===============#
CXX 		:= gcc
STDFLAG 	:= -std=c11 -pthread
CXXFLAGS	:= 
DBGFLAGS	:= -g
CCOBJFLAGS	:= $(CXXFLAGS) -c

#============DIRECTORIES===============#
SRC_DIR	:= 	src
INC_DIR	:=	includes
LIB_DIR	:=	lib
TST_DIR	:=	test
OBJ_DIR	:=	obj
BIN_DIR	:=	bin
DOC_DIR	:=	doc

EXE_DIR :=	$(OBJ_DIR)

#==============SOURCES=================#
#SOURCE 1
NAME1	:= main
SRC_1 	:= $(SRC_DIR)/$(NAME1).c
OBJ_1 	:= $(OBJ_DIR)/$(NAME1).o

#SOURCE 2
NAME2	:= task
SRC_2 	:= $(SRC_DIR)/$(NAME2).c
OBJ_2 	:= $(OBJ_DIR)/$(NAME2).o

#SOURCE 3
NAME3	:= threadPool
SRC_3 	:= $(SRC_DIR)/$(NAME3).c
OBJ_3 	:= $(OBJ_DIR)/$(NAME3).o

#==============INCLUDES================#
INC     := -I./ -I ./$(INC_DIR)

#==============WARNINGS================#
WALL	:=	-Wall -Wextra -Werror -Wwrite-strings -Wno-parentheses -pedantic \
     -Warray-bounds -Wno-unused-variable -Wno-unused-function \
     -Wno-unused-parameter -Wno-unused-result

#==============LIBRARIES===============#
LIBS    := -L./ -L/$(LIB_DIR)
# RPATH IS USED FOR LINKING LIBS IN SPECIFIC PATH
#RPATH="-Wl,-rpath,$(LIBRARY_DIR):$(THIRD_PARTY_LIB_DIR)"
RPATH	="-Wl,-rpath,$(LIB_DIR)"

#==============FLAGS===================#
#CPPFLAGS	=							#Pre proccesor Flags
CFLAGS 		= $(WALL) $(STDFLAG) $(INC)	#Compiler Flags 

ifeq ($(strip $(MODE)), debg)
	CFLAGS 	+= -g
endif

LDFFLAGS	= $(LIBS) $(RPATH)			#Linker Flags

#==============EXEC====================#

MODE ?= final  					#Default mode

ifeq ($(strip $(MODE)), test)
    DEF_NAME := $(TEST_NAME)
else ifeq ($(strip $(MODE)), debg)
    DEF_NAME := $(DEBG_NAME)
else
    DEF_NAME := $(FINAL_NAME)
endif

EXE_NAME 	:= $(DEF_NAME)

FINAL_EXE	:=	$(EXE_DIR)/$(EXE_NAME)

#==============ALL OBJ=================#
ALL_OBJS = $(OBJ_1) $(OBJ_2) $(OBJ_3)

#===============TARGETS=================#
all: $(FINAL_EXE)
	@echo "Compilando proyecto..."
	@echo "----------------------"

$(FINAL_EXE): $(ALL_OBJS)
	$(CXX) $^ -o $@ $(LDFFLAGS)

$(OBJ_1): $(SRC_1)
	@printf "\n"
	@echo "----------------------"
	$(CXX) $(CFLAGS) -c $< -o $@  
	@echo "----------------------"

$(OBJ_2): $(SRC_2)
	@printf "\n"
	@echo "----------------------"
	$(CXX) $(CFLAGS) -c $< -o $@
	@echo "----------------------"

$(OBJ_3): $(SRC_3)
	@printf "\n"
	@echo "----------------------"
	$(CXX) $(CFLAGS) -c $< -o $@
	@echo "----------------------"

setup:
	mkdir -p $(SRC_DIR) $(INC_DIR) $(OBJ_DIR) $(BIN_DIR) $(DOC_DIR) $(TST_DIR)

clean:
	rm -f $(OBJ_DIR)/* 
	rm -f $(BIN_DIR)/*