#include "error.h"

void handle_error(ERROR err, int line_number){

    fprintf(stderr, "Fatal error on line: %d\n", line_number);

    assert(err < 0);

    switch (err) {
        case MALLOC_ERROR:                    fprintf(stderr, "%s\n", "Error allocating memory!");
                                              exit(-err);

        case VARIABLE_ALREADY_DECLARED:       fprintf(stderr, "%s\n", "Variable was declared more than once!");
                                              exit(-err);
        case VARIABLE_WAS_NOT_DECLARED:       fprintf(stderr, "%s\n", "Variable mentioned, but not declared!");
                                              exit(-err);

        case FUNCTION_WRONG_NUMBER_OF_ARGS:   fprintf(stderr, "%s\n", "Function called with wrong number of args!");
                                              exit(-err);
        case FUNCTION_WRONG_ARG_TYPE:         fprintf(stderr, "%s\n", "Function called with arguments of the wrong type!");
                                              exit(-err);
            
            
    }
}
