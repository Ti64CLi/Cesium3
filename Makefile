INC=-I/home/wbhart/gc/include
LIB=-L/home/wbhart/gc/lib
OBJS=backend.o types.o symbol.o input.o ast.o exception.o parser.o
HEADERS=ast.h exception.h parser.h input.h symbol.h types.h backend.h

cesium: cesium.c $(HEADERS) $(OBJS)
	gcc -O2 -o cesium cesium.c $(INC) $(OBJS) $(LIB) -lgc

ast.o: ast.c $(HEADERS)
	gcc -c -O2 -o ast.o ast.c $(INC)

exception.o: exception.c $(HEADERS)
	gcc -c -O2 -o exception.o exception.c $(INC)

parser.o: parser.c $(HEADERS)
	gcc -c -O2 -o parser.o parser.c $(INC)

input.o: input.c $(HEADERS)
	gcc -c -O2 -o input.o input.c $(INC)

symbol.o: symbol.c $(HEADERS)
	gcc -c -O2 -o symbol.o symbol.c $(INC)

types.o: types.c $(HEADERS)
	gcc -c -O2 -o types.o types.c $(INC)

backend.o: backend.c $(HEADERS)
	gcc -c -O2 -o backend.o backend.c $(INC)

