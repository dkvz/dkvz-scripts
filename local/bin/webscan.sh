#!/bin/bash

# Combines a few tools to analyse the tech stack of websites.

if [[ -z "$1" ]]; then
  echo "Please provide a URL to test as the first argument"
  echo "It's best to use the full https://domain.tld/ string"
  exit 0
fi

if ! type "iplookup-node" > /dev/null; then
  echo "Missing iplookup binary in PATH"
  echo "Can be installed using "
  echo "npm install -g @dkvz/iplookup-cli"
  exit 1
fi

if ! type "stacks-cli" > /dev/null; then
  echo "Missing stacks-cli binary in PATH"
  echo "Can be installed using "
  echo "npm install -g stacks-cli"
  exit 1
fi

iplookup "$1"
echo 

stacks-cli -u "$1"

# For curl we add a flash if absent.
URL_W_SLASH=$(sed 's![^/]$!&/!' <<< "$1")
echo
echo "Response headers"
echo "================"
curl -s -o /dev/null -D - "$URL_W_SLASH"
echo "================"
echo 
echo "Done."