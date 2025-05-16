#!/bin/bash

# Open a new tmux session
# Unless there's at least one detached session,
# in which case we attach the last one.
#
# For new sessions we have an option to open
# a vertical split immediately using "s" or "-s"
# as the first argument.

if tmux ls > /dev/null 2>&1; then
  tmux a
else
  case "$1" in
    -s|s)
      tmux new-session -d
      tmux split-window -h
      tmux a
      ;;
    *)
      tmux
      ;;
  esac
fi
