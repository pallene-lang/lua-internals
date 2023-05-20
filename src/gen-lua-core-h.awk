# Merge a list of header files, so you can get all of them in a single include.
# Basically we concatenate them, except that we remove the #include directives
# referring to the files that we are merging. Note that we require that the
# list be already sorted in the order of the dependencies.

function is_core_include() {
    return \
        match($0, /^ *#include/) &&
        match($0, /".*"/) &&
        is_core[substr($0, RSTART+1, RLENGTH-2)]
}

function is_header(name) {
    return name ~ /\.h$/
}

BEGIN {
    for (i = 1; i < ARGC; i++) {
        if (is_header(ARGV[i])) {
            is_core[ARGV[i]] = 1
        }
    }

    print "#ifndef luacore_h"
    print "#define luacore_h"
    # The following line solves a circular dependency between lstate and ltm
    # It's lifted from lstate.h (please refer to the comment there)
    print "typedef struct CallInfo CallInfo;"

}

BEGINFILE {
    if (!is_header(FILENAME)) {
        nextfile
    }
}

!is_core_include() { print }

END {
    print "#endif"
}
