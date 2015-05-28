%{

%}

%union {
    int    vali;
    char*  vals;
    /* double vald; */
}

/* %token <vals> type */
%token <vals> id

%token <vali> integer
%token <vals> string
/* %token <vald> decimal */

%token BEGINPRGM DECLARE STATEMENTS
%token INTEGER STRING ARRAY 

%token TRUE_VALUE FALSE_VALUE                       /* Boolean values */

%token SET 
%token WHILE COND                                   /* Flow functions */
%token PLUS MINUS MULT DIV MOD                      /* Math operators */
%token LESS LESSEQ EQ DIFF GREATER GREATEREQ        /* Relational operators */
%token AND NOT OR                                   /* Logic operators */
%token GET LEN                                      /* Functions over arrays */
%token CAT                                          /* Functions over strings */
%token PRINT PROMPT                                 /* IO functions */

%%

program           : '(' BEGINPRGM  
                         '(' DECLARE declarations ')' 
                         '(' STATEMENTS statements ')' 
                    ')'

                  ;

declarations      : 
                  | declarations declaration
                  ;

declaration       : '(' INTEGER id ')'
                  | '(' STRING id  ')'
                  | '(' ARRAY integer id ')'
                  ;

statements        : statement
                  | statements statement
                  ;

statement         : '(' function arguments ')'
                  ;

function          : SET
                  | WHILE
                  | COND
                  | PLUS 
                  | MINUS
                  | MULT
                  | DIV
                  | MOD
                  | LESS
                  | LESSEQ
                  | EQ
                  | DIFF
                  | GREATER
                  | GREATEREQ
                  | AND
                  | OR
                  | NOT
                  | GET
                  | LEN
                  | CAT
                  | PRINT
                  | PROMPT
                  ;

arguments         : 
                  | arguments argument
                  ;

argument          : statement
                  | id
                  | integer
                  | string
                  | boolean
                  | '(' argument ')'
                  ;

boolean           : TRUE_VALUE
                  | FALSE_VALUE
                  ;

%%

#include "lex.yy.c"

int yyerror(char *s) {
    fprintf(stderr, "%s, line %d\n", s, yylineno);
    return 0;
}


int main(int argc, char* argv[]){
    yyparse();
    return 0;
}
