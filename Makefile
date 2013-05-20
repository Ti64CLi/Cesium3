INC=-I/usr/local/include -I/home/wbhart/gc/include
LIB=-L/usr/local/lib -L/home/wbhart/gc/lib
OBJS=backend.o serial.o inference.o environment.o types.o symbol.o ast.o exception.o parser.o
HEADERS=ast.h exception.h symbol.h types.h environment.h inference.h serial.h backend.h
CS_FLAGS=-O2 -g -D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS

cesium: cesium.c $(HEADERS) $(OBJS)
	g++ $(CS_FLAGS) cesium.c -o $(INC) $(OBJS) $(LIB) -lgc `/usr/local/bin/llvm-config --libs --cflags --ldflags core analysis executionengine jit interpreter native` -o cs -ldl

ast.o: ast.c $(HEADERS)
	gcc $(CS_FLAGS) -c ast.c -o ast.o $(INC)

exception.o: exception.c $(HEADERS)
	gcc $(CS_FLAGS) -c exception.c -o exception.o $(INC)

parser.o: parser.c $(HEADERS)
	gcc $(CS_FLAGS) -c parser.c -o parser.o $(INC)

symbol.o: symbol.c $(HEADERS)
	gcc $(CS_FLAGS) -c symbol.c -o symbol.o $(INC)

types.o: types.c $(HEADERS)
	gcc $(CS_FLAGS) -c types.c -o types.o $(INC)

environment.o: environment.c $(HEADERS)
	gcc $(CS_FLAGS) -c environment.c -o environment.o $(INC)

inference.o: inference.c $(HEADERS)
	gcc $(CS_FLAGS) -c inference.c -o inference.o $(INC)

serial.o: serial.c $(HEADERS)
	gcc $(CS_FLAGS) -c serial.c -o serial.o $(INC)

backend.o: backend.c $(HEADERS)
	gcc $(CS_FLAGS) -c backend.c -o backend.o $(INC)

parser.c: greg parser.leg
	greg-0.4.3/greg -o parser.c parser.leg

doc:
	pdflatex --output-format=pdf -output-directory doc doc/cesium.tex

greg:
	$(MAKE) -C greg-0.4.3

clean:
	rm -f *.o
	rm -f greg-0.4.3/*.o
	rm -f cs
	rm -f greg-0.4.3/greg
	rm -f parser.c

.PHONY: doc clean 
