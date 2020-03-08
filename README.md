# C,CPP Workshop
This place is making C/CPP Library or Test about C, CPP
<br>
Using GNU Compiler

## Simple Command
- When C : gcc -o [outputname] [inputname].c
- When C++ : g++ -o [outputname] [inputname].cpp

## GCC Compiler Options
ex) g++ -Wall -g -o [outputname] [inputname].cpp<br>
- -o: specifies the output executable filename
- -Wall: prints "all" Warning messages
- -g: Generates additional symbolic debugging information for use with gdb debugger

## Compile & Link Separately
ex)<br>
// Compile-only with -c option <br>
g++ -c -Wall -g Hello.cpp <br>
// Link object file(s) into an executable <br>
g++ -g -o Hello Hello.o <br><br>
The options
- -c: Compile into object file. By default, the object file has the same name as the source file with extension of ".o"

## Compile & Link Multiple Source Files
ex)<br>
g++ -o [outputname] [inputname1].cpp <br>
Separate Compile & Link <br>
ex)<br>
g++ -c [inputname1].cpp<br>
g++ -c [inputname2].cpp<br>
g++ -o [outputname] [output object].o [output object].o

## Compile into a Shared Library
To compile and link C/C++ program into a shared library(".dll" in windows, ".so" in Unixes), use <b>-shared</b> option

## GNU Make - Automatic Variables
- $@: the target filename
- $*: the target filename without the file extension
- $<: the first prerequisite filename
- $^: the filenames of all the prerequisites, separated by spaces, discard duplicates
- $+: similar to $^, but includes duplicates
- $?: the names of all prerequisites that are newer than the target
