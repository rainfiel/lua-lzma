LIBNAME = lzma
LUADIR = ../../../skynet/3rd/lua

COPT = -O2
# COPT = -DLPEG_DEBUG -g

CWARNS = -Wall -Wextra -pedantic \
	-Waggregate-return \
	-Wcast-align \
	-Wcast-qual \
	-Wdisabled-optimization \
	-Wpointer-arith \
	-Wshadow \
	-Wsign-compare \
	-Wundef \
	-Wwrite-strings \
	-Wbad-function-cast \
	-Wdeclaration-after-statement \
	-Wmissing-prototypes \
	-Wnested-externs \
	-Wstrict-prototypes \
# -Wunreachable-code \

SRC =\
LzmaLib.c\
LzmaDec.c\
LzmaEnc.c\
LzFind.c\
LzAlloc.c\

CFLAGS = $(CWARNS) $(COPT) -std=c99 -I$(LUADIR) -fPIC
CC = gcc

FILES = src/LzFind.o src/LzAlloc.o src/LzmaDec.o src/LzmaEnc.o src/LzmaLib.o src/llzma.o

# For Linux
linux:
	make lzma.so "DLLFLAGS = -shared -fPIC"

# For Mac OS
macosx:
	make lzma.so "DLLFLAGS = -bundle -undefined dynamic_lookup"

lzma.so: $(FILES)
	env $(CC) $(DLLFLAGS) $(FILES) -o lzma.so

$(FILES): Makefile

clean:
	rm -f $(FILES) lzma.so

LzFind.o: src/LzFind.c
LzAlloc.o: src/LzAlloc.c
LzmaDec.o: src/LzmaDec.c
LzmaEnc.o: src/LzmaEnc.c
LzmaLib.o: src/LzmaLib.c
llzma.o: src/llzma.c
