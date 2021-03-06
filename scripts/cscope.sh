#!/bin/sh
find $(pwd) -name '*.py' \
    -o -name '*.java' \
    -o -iname '*.[CH]' \
    -o -name '*.cpp' \
    -o -name '*.cc' \
    -o -name '*.hpp'  \
    > cscope.files

# -R: recursively
# -b: just build
# -q: create inverted index
cscope -Rbq
