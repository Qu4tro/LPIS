#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#define MALLOC_ERROR -1
#define VARIABLE_ALREADY_DECLARED -2
#define VARIABLE_WAS_NOT_DECLARED -3

#define SUCCESS 0

typedef int ERROR;

void handle_error(ERROR err, int line_number);
