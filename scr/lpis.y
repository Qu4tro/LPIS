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

int arg_i = 0;
type args[100];


%}

%union {
    int    vali;
    char*  vals;
    type   var_type;
    type*  args_types;
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

statement         : '(' function arguments ')'          
                  ;

function          : SET                                 {$$ = SET_ID;       }
                  | WHILE                               {$$ = WHILE_ID;     }
                  | COND                                {$$ = COND_ID;      }
                  | PLUS                                {$$ = PLUS_ID;      }
                  | MINUS                               {$$ = MINUS_ID;     }
                  | MULT                                {$$ = MULT_ID;      }
                  | DIV                                 {$$ = DIV_ID;       }
                  | MOD                                 {$$ = MOD_ID;       }
                  | LESS                                {$$ = LESS_ID;      }
                  | LESSEQ                              {$$ = LESSEQ_ID;    }
                  | EQ                                  {$$ = EQ_ID;        }
                  | DIFF                                {$$ = DIFF_ID;      }
                  | GREATER                             {$$ = GREATER_ID;   }
                  | GREATEREQ                           {$$ = GREATEREQ_ID; }
                  | AND                                 {$$ = AND_ID;       }
                  | OR                                  {$$ = OR_ID;        }
                  | NOT                                 {$$ = NOT_ID;       }
                  | GET                                 {$$ = GET_ID;       }
                  | LEN                                 {$$ = LEN_ID;       }
                  | CAT                                 {$$ = CAT_ID;       }
                  | PRINT                               {$$ = PRINT_ID;     }
                  | PROMPT                              {$$ = PROMPT_ID;    }
                  ;

arguments         : 
                  | arguments argument
                  ;

argument          : statement                       
                  | id                                  {if ((error_flag = get_variable(vars, $1, &arg_type)) != SUCCESS){
                                                            handle_error(error_flag, yylineno);
                                                        }}
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


int main(int argc, char* argv[]){
    yyparse();
    return 0;
}
