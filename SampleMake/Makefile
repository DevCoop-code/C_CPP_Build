all:hello

hello: hello.o
	gcc -o hello hello.o	/*gcc -o $@ $<*/

hello.o: hello.c
	gcc -c hello.c			/*gcc -o $<*/

clean:
	rm hello.o hello