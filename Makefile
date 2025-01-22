#======================================#
#
# 		BASIC MAKEFILE TEMPLATE
#
#======================================#

#============PROJECT INFO==============#
TEST_EXE_NAME   :=   test_exce		#Testing 	executable name
DEBG_EXE_NAME   :=   debg_exce		#Debuging 	executable name
FINAL_EXE_NAME  :=   final_exce		#Final 		executable name
FINAL_EXE_DIR   :=   ./
FINAL_EXE       :=   $(FINAL_EXE_DIR)/$(FINAL_EXE_NAME)

#============TOOL MACROS===============#
CXX 		:= gcc
CXXFLAGS	:= 
DBGFLAGS	:= -g
CCOBJFLAGS	:= $(CXXFLAGS) -c
STDFLAG 	:= -std=c11

#===============PATHS==================#
SRC_PATH := src
INC_PATH := includes
LIB_PATH := lib
BIN_PATH := bin
OBJ_PATH := obj
DBG_PATH :=	debug
DOC_PATH := doc

#============COMPILE MACRO=============#


#==============SOURCES=================#
#SOURCE 1
MODULE_1_NAME	= main
OBJ_1 =   $(OBJ_PATH)/main.o
SRC_1 =   $(SRC_PATH)/main.c

#SOURCE 2
MODULE_2_NAME	= fsm
OBJ_2 = $(OBJ_PATH)/fsm.o
SRC_2 = $(SRC_PATH)/fsm.c

#SOURCE 3
MODULE_3_NAME   = my_wrappers
SRC_3   =   $(SRC_PATH)/$(MODULE_3_NAME).c
OBJ_3   =   $(OBJ_PATH)/$(MODULE_3_NAME).o

#==============WARNINGS================#
WALL	:=	-Wall -Wextra -Werror -Wwrite-strings -Wno-parentheses -pedantic \
     -Warray-bounds -Wno-unused-variable -Wno-unused-function \
     -Wno-unused-parameter -Wno-unused-result

#==============INCLUDES================#
INC     := -I./ -I ./$(INC_PATH)

#==============LIBRARIES===============#
LIBS    := -L./ -L/$(LIB_PATH)
# RPATH IS USED FOR LINKING LIBS IN SPECIFIC PATH
#RPATH="-Wl,-rpath,$(LIBRARY_DIR):$(THIRD_PARTY_LIB_DIR)"
RPATH	:="-Wl,-rpath,$(LIB_PATH)"

#==============FLAGS===================#
#CPPFLAGS        =		#Pre proccesor Flags
CFLAGS := $(WALL) $(STDFLAG) $(INC)	#Compiler Flags 
LDFFLAGS:= $(LIBS) $(RPATH)	#Linker Flags

#==============ALL OBJ=================#
ALL_OBJS = $(OBJ_1) $(OBJ_2) $(OBJ_3) #$(OBJ_4)

#===============TARGETS=================#
all: $(FINAL_EXE)
	@echo "Compilando proyecto..."

$(FINAL_EXE): $(ALL_OBJS)
	$(CXX) $^ -o $@ $(LDFFLAGS)

$(OBJ_1): $(SRC_1)
	$(CXX) $(CFLAGS) -c $< -o $@  

$(OBJ_2): $(SRC_2)
	$(CXX) $(CFLAGS) -c $< -o $@

$(OBJ_3): $(SRC_3)
	$(CXX) $(CFLAGS) -c $< -o $@

.PHONY: clean set_up all