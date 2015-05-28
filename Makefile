YACC = lpis.y
FLEX = lpis.l
EXECUTABLE = lpis
CC = gcc

all: y.tab.c lex.yy.c
	$(CC) y.tab.c -o $(EXECUTABLE)

lex.yy.c: $(FLEX)
	flex $(FLEX)

y.tab.c: $(YACC)
	yacc $(YACC)

clean:
	rm y.tab.c
	rm lex.yy.c
	rm $(EXECUTABLE)
