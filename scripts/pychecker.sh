#!/bin/sh
# check python files
# requires pylint and pep8 packages

pylint $1
echo "## pylint above, pep8 below ##"
pep8 --repeat $1

