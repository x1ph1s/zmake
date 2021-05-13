include ../project.mk

CFLAGS +=-I ../qfib

SRCFOLDER :=.
SRC :=main.cpp

BIN :=test

MAKEFOLDER:=../.make
include $(MAKEFOLDER)/defaults.mk
include $(MAKEFOLDER)/bin.mk

$(eval $(call link,build/qfib/%m/lib,qfib))
