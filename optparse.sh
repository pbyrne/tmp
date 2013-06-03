#!/bin/bash

main() {
  print_first_argument $*
  conditional_from_argument $*
  conditional_if_has_argument $*
}

print_first_argument() {
  echo "First argument is: " $1
}

conditional_from_argument() {
  flag=$1
  [ "$flag" = "--remove" ] && echo "removing" || echo "doing nothing"
}

conditional_if_has_argument() {
  flat=$1
  [ -n "$flag" ] && echo "a flag passed" || echo "no flag passed"
}

main $*
