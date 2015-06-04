%{
#include "var.h"
#include "error.h"
#include "types.h"

int yylex();
int yylineno;

int yyerror(char *s) {
    fprintf(stderr, "%s, line %d\n", s, yylineno);
    return 0;
}

Vars* vars = NULL;
ERROR error_flag;

type arg_type;
%}

%union {
    int    vali;
    char*  vals;
    type   var_type;
    /* double vald; */
}

%token <vals> id

%token <vali> integer
%token <vals> string

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

%type <var_type> argument
%type <var_type> statement
%type <var_type> function

%start program

%%

program           : '(' BEGINPRGM  
                         '(' DECLARE declarations ')'   
                         '(' STATEMENTS statements ')' 
                    ')'

                  ;

declarations      :
                  | declarations declaration
                  ;

declaration       : '(' INTEGER id ')'                  {if ((error_flag = add_variable(&vars, $3, 0)) < 0){
                                                            handle_error(error_flag, yylineno);
                                                        }}
                  | '(' STRING id  ')'                  {if ((error_flag = add_variable(&vars, $3, 1)) < 0){
                                                            handle_error(error_flag, yylineno);
                                                        }}
                  | '(' ARRAY integer id ')'            {if ((error_flag = add_variable(&vars, $4, 2)) < 0){
                                                            handle_error(error_flag, yylineno);
                                                        }}
                  ;

statements        : statement
                  | statements statement
                  ;

statement         : '(' function arguments ')'          {$$ = $2;}
                  ;

function          : SET                                 {$$ = NO_TYPE;}
                  | WHILE                               {$$ = NO_TYPE;}
                  | COND                                {$$ = NO_TYPE;}
                  | PLUS                                {$$ = INTEGER_TYPE;}
                  | MINUS                               {$$ = INTEGER_TYPE;}
                  | MULT                                {$$ = INTEGER_TYPE;}
                  | DIV                                 {$$ = INTEGER_TYPE;}
                  | MOD                                 {$$ = INTEGER_TYPE;}
                  | LESS                                {$$ = BOOLEAN_TYPE;}
                  | LESSEQ                              {$$ = BOOLEAN_TYPE;}
                  | EQ                                  {$$ = BOOLEAN_TYPE;}
                  | DIFF                                {$$ = BOOLEAN_TYPE;}
                  | GREATER                             {$$ = BOOLEAN_TYPE;}
                  | GREATEREQ                           {$$ = BOOLEAN_TYPE;}
                  | AND                                 {$$ = BOOLEAN_TYPE;}
                  | OR                                  {$$ = BOOLEAN_TYPE;}
                  | NOT                                 {$$ = BOOLEAN_TYPE;}
                  | GET                                 {$$ = INTEGER_TYPE;}
                  | LEN                                 {$$ = INTEGER_TYPE;}
                  | CAT                                 {$$ = STRING_TYPE;}
                  | PRINT                               {$$ = NO_TYPE;}
                  | PROMPT                              {$$ = NO_TYPE;}
                  ;

arguments         : 
                  | arguments argument
                  ;

argument          : statement                           {$$ = 0;}
                  | id                                  {if ((error_flag = get_variable(vars, $1, &arg_type)) != SUCCESS){
                                                            handle_error(error_flag, yylineno);
                                                        }}
                  | integer                             {$$ = INTEGER_TYPE;}
                  | string                              {$$ = STRING_TYPE;}
                  | boolean                             {$$ = BOOLEAN_TYPE;}
                  | '(' argument ')'                    {$$ = $2;}
                  ;

boolean           : TRUE_VALUE
                  | FALSE_VALUE
                  ;

%%

#include "lex.yy.c"


int main(int argc, char* argv[]){
    yyparse();
    return 0;
}
