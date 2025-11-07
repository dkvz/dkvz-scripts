#!/bin/bash

# Generates a random password, defaults to a long one
# without special chars.

# TODO: Allow making passwords with select special chars.

# Randomizing default password len so it's harder
# to build hashcat masks against these:
DEF_LEN=$((RANDOM%(21-14+1)+14))
PLEN="${1:-$DEF_LEN}"
if [[ ! $PLEN -gt 1 ]]; then
  echo "Invalid password length."
  echo "Please provide a number as the first argument."
  exit 1
fi

tr -cd '[:alnum:]' < /dev/urandom | head -c "$PLEN"
echo ""
