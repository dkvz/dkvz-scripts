#!/bin/bash

# Open a new tmux session
# Unless there's at least one detached session,
# in which case we attach the last one.

if tmux ls > /dev/null; then
  tmux a
else
  tmux
fi
