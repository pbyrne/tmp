#!/bin/bash

main() {
  count=$1

  if [ $count != "" ]; then
    echo All
    ls sample/ | sort --numeric-sort

    echo All but the last $count
    ls sample/ | sort --numeric-sort | tail -n +$((count + 1))
  else
    usage
  fi
}

usage() {
  echo all-but-last.sh COUNT
  echo
  echo Display all but the last COUNT items in sample/
  echo
  echo Ex: all-but-last.sh 4
  exit 1
}

main $*
