#****************************************
#
# BASIC MAKEFILE TEMPLATE
#
#****************************************

#** PATHS *******************************

#Source         Folder Path
SRC_DIR         =   src
#Includes       Folder Path
INC_DIR         =   includes
#Lib            Folder Path
LIB_DIR         =   lib
#Objects        Folder Path
OBJS_DIR        =   objs
#Binary         Folder Path
BIN_DIR         =   bin
#Doc            Folder Path
DOC_DIR         =   doc


#** SOURCES *****************************

#SOURCE 1
MODULE_1_NAME   = main
SRC_1   =   $(SRC_DIR)/$(MODULE_1_NAME).c
OBJ_1   =   $(OBJS_DIR)/$(MODULE_1_NAME).o
#SOURCE 2
#MODULE_2_NAME   =
#SRC_2   =   $(MODULE_2_NAME).c
#OBJ_2   =   $(OBJS_DIR)/$(MODULE_2_NAME).o
#SOURCE 3
#MODULE_3_NAME   =
#SRC_3   =   $(MODULE_3_NAME).c
#OBJ_3   =   $(OBJS_DIR)/$(MODULE_3_NAME).o


#** EXECUTABLE **************************

#Final executable name
FINAL_EXE_NAME  =   final_exce
FINAL_EXE_DIR   =   ./
FINAL_EXE       =   $(FINAL_EXE_DIR)/$(FINAL_EXE_NAME)
#Testing executable name
TEST_EXE_NAME   =   test_exce


#** COMPILATOR **************************

#Program for compiling in C
CC              =   gcc
#Version of the compiler#Module/src 1
STDFLAG         =   -std=c11


#** WARNINGS   **************************

WALL	=	-Wall -Wextra -Werror -Wwrite-strings -Wno-parentheses -pedantic \
     -Warray-bounds -Wno-unused-variable -Wno-unused-function \
     -Wno-unused-parameter -Wno-unused-result


#** INCLUDES ****************************

INC     = -I./ -I/$(INC_DIR)


#** LIBRARIES ***************************

LIBS    = -L./ -L/$(LIB_DIR)
# RPATH IS USED FOR LINKING LIBS IN SPECIFIC PATH
#RPATH="-Wl,-rpath,$(LIBRARY_DIR):$(THIRD_PARTY_LIB_DIR)"
RPATH	="-Wl,-rpath,$(LIB_DIR)"


#** FLAGS *******************************

#Pre proccesor Flags
#CPPFLAGS        =    
#Compiler Flags
CFLAGS          =   $(INC) $(STDFLAG)
#Linker Flags 
LDFFLAGS        =   $(LIBS) $(RPATH)


#** ALL OBJECTS *************************

ALL_OBJS = $(OBJ_1) #$(OBJ_2) #$(OBJ_3) #$(OBJ_4)


#** TARGETS *****************************

all: $(FINAL_EXE)
	@echo "Compilando proyecto..."

$(FINAL_EXE): $(ALL_OBJS)
	$(CC) $^ -o $@ $(LDFFLAGS)

$(OBJ_1): $(SRC_1)
	$(CC) $(CFLAGS) -c $< -o $@

#$(OBJ_2): $(SRC_2)
#	$(CC) $(CFLAGS) -c $< -o $@

#$(OBJ_3): $(SRC_3)
#	$(CC) $(CFLAGS) -c $< -o $@

set_up:
	@echo "building all directories if not existe..."
	mkdir -p $(SRC_DIR)	
	mkdir -p $(INC_DIR)
	mkdir -p $(LIB_DIR)
	mkdir -p $(OBJS_DIR)
	mkdir -p $(BIN_DIR)
	mkdir -p $(DOC_DIR)

clean:
	@echo "cleaning proyect"
	rm -f $(OBJS_DIR)/*.o
	rm -f $(BIN_DIR)/
	rm -f $(FINAL_EXE_NAME)

.PHONY: clean set_up all