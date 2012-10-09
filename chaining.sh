#!/bin/bash

main() {
  echo compressing `some_output` to `outfile`
  some_output | compress
}

some_output() {
  echo "foo!"
}

compress() {
  gzip -f > `outfile`
}

outfile() {
  echo "filename.gz"
}

main $*
