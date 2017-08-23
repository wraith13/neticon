SRCS = \
	neticon.cpp \
	neticon.rc

OBJS = $(subst .rc,.res,$(subst .cpp,.o,$(SRCS))) 

CFLAGS = -finput-charset=cp932 -I.
LIBS = -lgdi32 -lws2_32 -lcomctl32
TARGET = neticon.exe

.SUFFIXES: .rc .res .cpp .o

all : $(TARGET)

$(TARGET) : $(OBJS)
	g++ -std=c++14 -o $@ $(OBJS) $(LIBS)

.cpp.o :
	g++ -std=c++14 -c $(CFLAGS) $< -o $@

.rc.res :
	windres -c cp932 -O coff -I. $< -o $@

neticon.cpp : VERSION.h

VERSION.h : VERSION.cmd
	cat VERSION.cmd | grep VERSION_ | awk '{print $$2}' | sed 's/=/ /' | xargs -i -n 1 echo "#define {}" > VERSION.h

clean :
	rm -f *.o $(TARGET) VERSION.h
