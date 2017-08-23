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

neticon.cpp : .VERSION.h

.VERSION.h :
	mv VERSION.h .VERSION.h
	iconv -f utf-8 -t cp932 .VERSION.h > VERSION.h

clean :
	rm -f *.o $(TARGET)
