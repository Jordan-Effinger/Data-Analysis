#	Makefile for the 'Palindrome' code.

SYSBIN   = /usr/bin
SYSSHARE = /usr/local/share
SYSOPT   = /opt
BASEDIR  = ..
HOMEDIR  = /home/$(WHO)
USRBIN   = $(HOMEDIR)/System/Bin
OBJDIR   = $(BASEDIR)/Obj
BUILDDIR = $(BASEDIR)/Build
SRCDIR   = $(BASEDIR)/Src
BINDIR   = $(BASEDIR)/Bin
DOCDIR   = $(BASEDIR)/Doc

CC  = $(SYSBIN)/gcc
RM  = $(SYSBIN)/rm
CP  = $(SYSBIN)/cp
LS  = $(SYSBIN)/ls
AR  = $(SYSBIN)/ar
SH  = $(SYSBIN)/bash
BI  = $(SYSBIN)/bison
PWD = $(SYSBIN)/pwd
WHO = $(SYSBIN)/whoami
TAR = $(SYSBIN)/tar

CC_LIBS  = -lm
CC_INFO  = -Wall -Wextra -pedantic
CC_FLAGS = -O3
CC_DBG   = $(CC_INFO) -g
RM_FLAGS = -r -f -d

SRC   = $(SRCDIR)/main.c \
				$(SRCDIR)/average.c \
				$(SRCDIR)/std_dev.c

OBJ   = $(OBJDIR)/main.o \
				$(OBJDIR)/average.o \
				$(OBJDIR)/std_dev.o 

EXE   = $(BASEDIR)/main
TAR   = ../$(BASEDIR)/palindrome.tar
UEXE  = $(USRBIN)/palindrome
DEXE  = $(BASEDIR)/dmain #	Executable used for debugging
HEADS = $(SRCDIR)/Include.h

.PHONY: Debug Clean Install Pack Obj_list Src_list

Objects: $(SRC)
	$(CC) $(SRCDIR)/average.c $(CC_LIBS) $(CC_INFO) $(CC_FLAGS) -c -o $(OBJDIR)/average.o
	$(CC) $(SRCDIR)/main.c $(CC_LIBS) $(CC_INFO) $(CC_FLAGS) -c -o $(OBJDIR)/main.o
	$(CC) $(SRCDIR)/std_dev.c $(CC_LIBS) $(CC_INFO) $(CC_FLAGS) -c -o $(OBJDIR)/std_dev.o

Exec: $(OBJ)
	$(CC) $(OBJ) $(CC_LIBS) $(CC_INFO) $(CC_FLAGS) -o $(EXE)

Debug: $(OBJ)
	$(CC) $(OBJ) $(CC_LIBS) $(CC_INFO) $(CC_DBG) -o $(DEXE)

InstalL: $(EXE)
	$(CP) $(EXE) $(UEXE)

Clean:
	$(RM) $(RM_FLAGS) $(OBJ) $(EXE) $(DEXE)

Src_list:
	$(LS) $(SRCDIR)

Obj_list:
	$(LS) $(OBJDIR)

