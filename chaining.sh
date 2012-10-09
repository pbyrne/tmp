#!/bin/bash

main() {
  echo "compressing result of '`output_command`' to `outfile`"
  $(output_command) | compress
}

output_command() {
  echo "ls"
}

compress() {
  gzip -f > `outfile`
}

outfile() {
  echo "filename.gz"
}

main $*
