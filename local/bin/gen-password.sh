#!/bin/bash

# Generates a random password, defaults to a long one
# without special chars.

# TODO: Allow making passwords with select special chars.

PLEN="${1:-18}"
if [[ ! $PLEN -gt 1 ]]; then
  echo "Invalid password length."
  echo "Please provide a number as the first argument."
  exit 1
fi

tr -cd '[:alnum:]' < /dev/urandom | fold -w$PLEN | head -n 1