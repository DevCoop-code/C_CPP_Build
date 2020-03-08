# Build using Makefile

MV ?= mv -f

LINK_TARGET = hello_c

# Add what you are want to build files
# [filename].o
OBJS = \
hello_c.o

REBUILDABLES = $(OBJS) $(LINK_TARGET)

clean:
	rm -rf $(REBUILDABLES)
	echo Clean done

build-all:clean-temp
	echo ALL DONE

clean-temp:move
	rm -rf $(REBUILDABLES)
	echo Clean Temp Files done

move:$(LINK_TARGET)
	MV $< ../Build_Result/$<

$(LINK_TARGET):$(OBJS)
	g++ -g -o $@ $^

# This logic is how to create a file with a .o suffix, given a file with a .cpp suffix
%.o:%.cpp
	g++ -g -o $@ -c $<

%.o:%.c
	gcc -g -o $@ -c $<

# Dependency Rules, which are rules without any command
# Main.o: Main.h Test1.h Test2.h
# Test1.o: Test1.h Test2.h
# Test2.o: Test2.h