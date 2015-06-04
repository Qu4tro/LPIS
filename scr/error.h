#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#define MALLOC_ERROR -1

#define VARIABLE_ALREADY_DECLARED -2
#define VARIABLE_WAS_NOT_DECLARED -3
#define FUNCTION_WRONG_NUMBER_OF_ARGS -4
#define FUNCTION_WRONG_ARG_TYPE -5

#define INTERNAL_ILLEGAL_OPERAND -6
#define INTERNAL_SEGMENTATION_FAULT -7
#define INTERNAL_STACK_OVERFLOW -8
#define INTERNAL_DIVISION_BY_ZERO -9
#define INTERNAL_ERR -10
#define INTERNAL_ANOMALY -11

#define SUCCESS 0

typedef int ERROR;

void handle_error(ERROR err, int line_number);
