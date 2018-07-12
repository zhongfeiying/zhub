#BIN = /cygdrive/d/MinGWStudio/MinGw/bin/
#BIN = /cygdrive/c/mingw/bin/
CC = $(BIN)gcc 
PRJ = luaredis
#CFLAGS = -mno-cygwin
CFLAGS = 
ifeq ($(notrace),1)
C_PROC= 
else
C_PROC = -DENABLE_TRACE
endif
ifeq ($(test),1)
C_PROC += -DENABLE_TEST
endif
INCPATH = -I./include
LIBPATH = -L./lib
LIBS = -ltrace -lcomctl32 -lws2_32 -llua5.1
#LDFLAGS = -mwindows -mno-cygwin
LDFLAGS = -pipe -shared -mwindows
DEPS = $(PRJ).dep
SRCS :=$(wildcard *.c)
HPPS :=$(wildcard *.h)
OBJS :=$(patsubst %.c,%.o,$(SRCS))
RRCS :=$(wildcard *.rc)
RRCS_OBJS :=$(patsubst %.rc,%.res,$(RRCS))
WINDRES = $(BIN)windres
all:$(PRJ).dll $(DEPS) tags
tags:$(SRCS) $(HPPS)
	ctags -R .
$(PRJ).dll :$(OBJS) $(RRCS_OBJS)
	$(CC) -o $@ $(OBJS) $(RRCS_OBJS) $(LIBPATH) $(LIBS) $(LDFLAGS)
%.o:%.c	
	$(CC) $(CFLAGS) $(C_PROC) $(INCPATH) -c $< 
%.res:%.rc
	$(WINDRES) -O COFF -i "$<" -o "$@"
$(DEPS):$(SRCS) $(HPPS)
	$(CC) -MM $(INCPATH) *.c >$(DEPS)
#-@if test ! -r "$(DEPS)";then echo>$(DEPS);fi
#	makedepend  -f$(DEPS)>&/dev/null *.c
-include $(DEPS)
install:
	cp $(PRJ).dll ../gcad/bin/
clean:
	-@rm *.o $(PRJ).dll *.dep *.res
