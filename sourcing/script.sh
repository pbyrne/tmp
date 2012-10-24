#!/bin/bash

FOO=foo
user=theusername
password=password

echo The value of FOO is $FOO

# Will this source relative to the script (inside the relativesource directory)
# or relative to the PWD (the parent of relativesource)?
# ./source.sh didn't work
# source ./source.sh
source $(dirname $0)/source.sh

echo "The value of FOO is now $FOO (expecting 'bar')"

# Testing a function from the sourced script that directly references variables
# from the parent script
log_in
