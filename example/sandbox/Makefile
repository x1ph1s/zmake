MAKEFOLDER:= ../.make
include $(MAKEFOLDER)/util.mk
include ../project.mk

CFLAGS += -I ../qfib

$(eval $(call link,build/qfib/%m/lib,qfib))

SRCFOLDER := .
SRC := main.cpp

BIN := test

include $(MAKEFOLDER)/defaults.mk
include $(MAKEFOLDER)/bin.mk

