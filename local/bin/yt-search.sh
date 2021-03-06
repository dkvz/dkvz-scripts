#!/bin/bash

usage() {
  echo "$(basename $0) <SEARCH_QUERY>"
  echo ""
  echo "Opens browser for Youtube search"
}

DEFAULT_BROWSER=xdg-open
BROWSER="${WEB_BROWSER:-$DEFAULT_BROWSER}"

if [[ -z "$1" ]]; then
  echo "No query provided."
  usage
  exit 1
fi

# Let's at least do *some* URL cleaning
# Replace space with what Youtube uses (+)
# instead of the URL encoded equivalent
CLEAN_URL=$(sed "s#\\s#+#g" <<< $@)

$BROWSER "https://youtube.com/results?search_query=$CLEAN_URL"