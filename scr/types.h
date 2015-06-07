#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include "error.h"

#define NO_TYPE 0

#define INTEGER_TYPE 1

#define STRING_TYPE 2
#define BOOLEAN_TYPE 3

typedef int type;

#define SET_ID 1
#define WHILE_ID 2
#define COND_ID 3
#define PLUS_ID 4
#define MINUS_ID 5
#define MULT_ID 6
#define DIV_ID 7
#define MOD_ID 8
#define LESS_ID 9
#define LESSEQ_ID 10
#define EQ_ID 11
#define DIFF_ID 12
#define GREATER_ID 13
#define GREATEREQ_ID 14
#define AND_ID 15
#define OR_ID 16
#define NOT_ID 17
#define GET_ID 18
#define LEN_ID 19
#define CAT_ID 20
#define PRINT_ID 21
#define PROMPT_ID 22
