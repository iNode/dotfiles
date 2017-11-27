#!/bin/sh
#
# data analysis functions and wrappers

csv2tsv () {
    tr ',' '	' "$@"
}


tsv2csv () {
    tr '	' ',' "$@"
}


# Sum first column, example: awkc 1 file | awks
awks() {
    awk 'BEGIN{sum=0} {sum+=$1} END{print sum}' "$*"
}

# Multiply first column, example: awkc 1 file | awkm
awkm() {
    awk 'BEGIN{mul=1} {mul*=$1} END{print mul}' "$*"
}

# Small shortcut for awk '{print $N}'. It is awp N for now. Literally.
awp() {
    awk "{print \$$1}"
}

# Prints columns 1 2 3 ... n.
slit() {
  awk "{ print ${(j:,:):-\$${^@}} }"
}

# awk to print psecified columns
# usage: awkc 1 2 instead of awk '{print $1,$2}'
awkc() {
    slit "$@"
}

