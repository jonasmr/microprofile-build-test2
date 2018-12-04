LDFLAGS+=-lpthread
CFLAGS=-Wno-c++11-extensions -I../..
#CFLAGS+=-fsanitize=undefined-trap -fsanitize-undefined-trap-on-error
CFLAGS+=-Wall -DMICROPROFILE_UI=0 -DMICROPROFILE_WEBSERVER=1 -DMICROPROFILE_GPU_TIMERS=0
CFLAGS+=-g -O0 -Wno-invalid-offsetof -Wall -Werror
#CFLAGS+=-DMICROPROFILE_ENABLED=0
CPPFLAGS=$(CFLAGS)

CFLAGS+=-std=c99

CPPFLAGS+=-std=c++11


CPP_SOURCES = fakework.cpp demo_noui.cpp ../../microprofile.cpp
C_SOURCES = test.c

TARGET=demo_noui
CC ?= clang
CXX ?= clang++
LD = $(CXX)

CPP_OBJS = $(patsubst %.cpp,%.o,$(CPP_SOURCES))
C_OBJS = $(patsubst %.c,%.o,$(C_SOURCES))

all: $(TARGET)

$(TARGET): $(C_OBJS) $(CPP_OBJS)
	$(LD) -o $(TARGET) $(C_OBJS) $(CPP_OBJS) $(LDFLAGS) $(CPPFLAGS)

-include .depend

../../microprofile.o: ../../microprofile.cpp ../../microprofile.h \
  ../../microprofile_html.h

.cpp.o: 
	echo "CXX IS" $(CXX)
	echo "CC IS" $(CC)
	$(CXX) -c $< $(CPPFLAGS) -o $@

.c.o:
	$(CC) -c $< $(CFLAGS) -o $@


clean: depend
	rm -f *.o ../../microprofile.o $(TARGET)

depend: $(CPP_SOURCES) $(C_SOURCES)
	$(CXX) -MM $(CPPFLAGS) $(CPP_SOURCES) >> .depend

embed_target:
	cd ../../src && make

embed: embed_target all

	

