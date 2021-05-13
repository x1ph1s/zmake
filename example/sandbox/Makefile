include ../project.mk

CFLAGS +=-I ../qfib

DEBUGLDDIR := build/qfib/debug/lib
RELEASELDDIR :=build/qfib/release/lib
LDFLAGS :=-lqfib
DEBUGLDFLAGS :=-L $(DEBUGLDDIR)
RELEASELDFLAGS :=-L $(RELEASELDDIR)

DEPEND := 
DEBUGDEPEND :=$(DEBUGLDDIR)/libqfib.a
RELEASEDEPEND :=$(RELEASELDDIR)/libqfib.a

SRCFOLDER :=.
SRC :=main.cpp

BIN :=test

MAKEFOLDER:=../.make
include $(MAKEFOLDER)/defaults.mk
include $(MAKEFOLDER)/bin.mk
