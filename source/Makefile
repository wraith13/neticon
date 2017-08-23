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
	g++ -mwindows -std=c++14 -o $@ $(OBJS) $(LIBS)

.cpp.o :
	g++ -std=c++14 -c $(CFLAGS) $< -o $@

.rc.res :
	windres -c cp932 -O coff -I. $< -o $@

neticon.cpp : generate-VERSION.h generate-BUILD.h

generate-VERSION.h : VERSION.cmd
	@cat VERSION.cmd | grep VERSION_ | awk '{print $$2}' | sed 's/=/ /' | xargs -i -n 1 echo "#define {}" > VERSION.h

generate-BUILD.h :
	@echo '// このファイルは mingw Makefile で自動生成されたものです。' | iconv -f utf-8 -t cp932 > BUILD.h
	@echo '#define BUILD mingw Build' >> BUILD.h

clean :
	rm -f *.o $(TARGET) VERSION.h BUILD.h
