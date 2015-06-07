#include "utils.h"
#include "error.h"

char* add_instr(char* fst, char* snd) {

    int len;
    char* out;

    if (fst == NULL){
        fst = strdup("");
    }
    if (snd == NULL){
        snd = strdup("");
    }

    len = sizeof(char) * (strlen(fst) + strlen(snd) + 1);
    out = malloc(len);

    if (out == NULL){
        handle_error(MALLOC_ERROR, 0);
    }

    sprintf(out, "%s%s", fst, snd);

    return out;
}

