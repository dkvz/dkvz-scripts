#!/bin/bash

# We need the shared variables:
source init-iplookup.sh

if [[ `type -P "iplookup-node"` ]]; then
  iplookup-node "$@"
else
  echo "You don't appear to have the iplookup binary in PATH"
  echo "Can be installed using "
  echo "npm install -g @dkvz/iplookup-cli"
fi