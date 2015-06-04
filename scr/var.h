#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "error.h"
#include "types.h"

typedef struct s_vars {
    char* name;
    type type;
    struct s_vars* prox;
} Vars;

void imprime(Vars* vars);

int add_variable(Vars** vars, char* var_name, int type);

int get_variable(Vars* vars, char* var_name, int* var_type);
