#!/bin/bash

# Opens the command line history file.
# If there's a zsh history, will try to open that one first.

open_hist() {
  vim "$1"
  exit 0
}

# Usually won't work because $HISTFILE may not be exported:
[[ ! -z "$HISTFILE" ]] && open_hist "$HISTFILE"

for hist_file in ~/.zhistory ~/.bash_history ~/.fish_history;
do
  if [[ -f "$hist_file" ]]; then
    open_hist "$hist_file"
  fi
done