#!/bin/sh
# check python files
# requires pyflakes and pep8 packages

pyflakes $1
echo "## pyflakes above, pep8 below ##"
pep8 --repeat $1

