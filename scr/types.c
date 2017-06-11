#include "types.h" 

void print_args(type* args){
    int i;
    for(i = 0; args[i] != -1; i++){
        if (args[i] == 0) printf("NOP ");
        if (args[i] == 1) printf("INT ");
        if (args[i] == 2) printf("STR ");
        if (args[i] == 3) printf("BOOL ");
    }
    printf("\n");
}

int arg_len(type* types){

    int i;
    for(i = 0; types[i] != -1; i++);

    return i;
}

int check_type(type supposed, type actual){

    if (actual == 0 || supposed == actual){
        return 1; 
    }
    return 0;
}

ERROR check_arguments(int function_id, type* types){

    switch (function_id) {
        case SET_ID:
                        printf("SET\n");
                        print_args(types);
                        break;
        case WHILE_ID:
                        printf("WHILE\n");
                        print_args(types);
                        break;
        case COND_ID:
                        printf("COND\n");
                        print_args(types);
                        break;
        case PLUS_ID:
                        printf("PLUS\n");
                        print_args(types);
                        break;
        case MINUS_ID:
                        printf("MINUS\n");
                        print_args(types);
                        break;
        case MULT_ID:
                        printf("MULT\n");
                        print_args(types);
                        break;
        case DIV_ID:
                        printf("DIV\n");
                        print_args(types);
                        break;
        case MOD_ID:
                        printf("MOD\n");
                        print_args(types);
                        break;
        case LESS_ID:
                        printf("LESS\n");
                        print_args(types);
                        break;
        case LESSEQ_ID:
                        printf("LESSEQ\n");
                        print_args(types);
                        break;
        case EQ_ID:
                        printf("EQ\n");
                        print_args(types);
                        break;
        case DIFF_ID:
                        printf("DIFF\n");
                        print_args(types);
                        break;
        case GREATER_ID:
                        printf("GREATER\n");
                        print_args(types);
                        break;
        case GREATEREQ_ID:
                        printf("GREATEREQ\n");
                        print_args(types);
                        break;
        case AND_ID:
                        printf("AND\n");
                        print_args(types);
                        break;
        case OR_ID:
                        printf("OR\n");
                        print_args(types);
                        break;
        case NOT_ID:
                        printf("NOT\n");
                        print_args(types);
                        break;
        case GET_ID:
                        printf("GET\n");
                        print_args(types);
                        break;
        case LEN_ID:
                        printf("LEN\n");
                        print_args(types);
                        break;
        case CAT_ID:
                        printf("CAT\n");
                        print_args(types);
                        break;
        case PRINT_ID:
                        printf("PRINT\n");
                        print_args(types);
                        break;
        case PROMPT_ID:
                        printf("PROMPT\n");
                        print_args(types);
                        break;
 
    }




}
