#!/bin/bash

set -e

# Decided to use fzf as the picker, so this script
# requires fzf.

DEFAULT_BROWSER=xdg-open
BROWSER="${WEB_BROWSER:-$DEFAULT_BROWSER}"

# Line separated list of websites to load instead
# of thee hardcoded list below.
WEBSITES_LIST=~/.local/etc/websites_list.txt

WEBSITES="https://www.google.com
https://github.com
https://bsky.app
https://dkvz.eu
"

if [[ -f "$WEBSITES_LIST" ]]; then
  WEBSITES=$(cat "$WEBSITES_LIST")
fi

SELECTED=$(fzf <<<"$WEBSITES")

# We don't need to check the return value because of set -e
$BROWSER "$SELECTED" >/dev/null
