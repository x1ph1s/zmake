# Project definitions
CC := g++

CFLAGS := -std=c++2a
DEBUGCFLAGS:= -g -D DEBUG
RELEASECFLAGS:= -O3 -D RELEASE

BUILDFOLDER := build/$(PREFIX)
