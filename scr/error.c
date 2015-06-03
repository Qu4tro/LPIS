#include "error.h"

void handle_error(ERROR err, int line_number){

    fprintf(stderr, "Fatal error on line: %d\n", line_number);

    assert(err < 0);

    switch (err) {
        case -1: fprintf(stderr, "%s\n", "Error allocating memory!");
                 exit(-err);
        case -2: fprintf(stderr, "%s\n", "Variable was declared more than once!");
                 exit(-err);
        case -3: fprintf(stderr, "%s\n", "Variable mentioned, but not declared!");
                 exit(-err);
            
            
    }
}
