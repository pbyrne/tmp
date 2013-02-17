#!/bin/bash

DEFAULT_KEY="~/.ssh/id_rsa_from_script"
GITHUB_KEY_URL="https://github.com/settings/ssh"

main() {
  make_key
  copy_key
  open_github_page
}

# Generate an SSH key if none exists
make_key() {
  if [ -e $DEFAULT_KEY ]; then
    # do nothing, key exists
    echo Already have $DEFAULT_KEY, skipping generation
  else
    # generate the key
    # -f $DEFAULT_KEY : Save to $DEFAULT_KEY
    # -P '' : With no passphrase
    echo Generating $DEFAULT_KEY
    ssh-keygen -f $DEFAULT_KEY -P ''
  fi
}

# Copy the key into the clipboard
copy_key() {
  cat $DEFAULT_KEY | pbcopy
}

# Open the GitHub page to paste the key into
open_github_page() {
  open $GITHUB_KEY_URL
}

main $*
