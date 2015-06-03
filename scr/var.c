#include "var.h"
#include "error.h"

void imprime(Vars* vars){
	
	while(vars != NULL){
		printf("Nome Vars: %s, type: %d\n", vars -> name, vars -> type);
		vars = vars->prox;
	}
}

ERROR add_variable(Vars** vars, char* var_name, int type){

    /* printf("%s\n", var_name); fflush(stdout); */
    int trash;
	Vars* new_var;

    if (get_variable(*vars, var_name, &trash) != VARIABLE_WAS_NOT_DECLARED){
        return VARIABLE_ALREADY_DECLARED; 
    }

    new_var = malloc(sizeof(struct s_vars));

    if (new_var == NULL){
        return MALLOC_ERROR;
    }
   
    new_var -> name = strdup(var_name);
    new_var -> type = type;
    
    if (vars != NULL){
        new_var -> prox = *vars;	
    } else {
        new_var -> prox = NULL;
    }

    *vars = new_var;
    return SUCCESS;
}

int get_variable(Vars* vars, char* var_name, int* var_type){

	while(vars != NULL){
		
        /* printf("%s -> %s\n", vars -> name, var_name); */
		if(strcmp(vars -> name, var_name) == 0){
            *var_type = vars -> type;
            /* printf("Returns 0 (Found var with name %s)", var_name); */
            return SUCCESS;
        }
		vars = vars -> prox;
	}
    /* printf("Couldn't find %s\n", var_name); */
    return VARIABLE_WAS_NOT_DECLARED;
}

/* int main(){ */
	
/*     Vars* vars = NULL; */
/*     add_variable(&vars, "var3", 2); */
/*     add_variable(&vars, "var5", 3); */
/*     add_variable(&vars, "var1", 0); */
/*     add_variable(&vars, "var2", 1); */
/*     add_variable(&vars, "var3", 2); */
/*     add_variable(&vars, "var5", 3); */
/*     add_variable(&vars, "var6", 4); */
/*     imprime(vars); */
/*     printf("Type: %d\n", get_variable(vars, "var6")); */
    
/* 	return 0; */
/* } */



