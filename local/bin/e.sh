#!/bin/bash

# Opens visual file explorer in the current directory.
# Possible Linux file explorers (I'm probably skipping KDE):
# - nautilus
# - nemo
# - thunar
# - dolphin
# - explorer (Windows)

for expl in nautilus nemo thunar dolphin explorer;
do
  if type "$expl" &> /dev/null; then
    "$expl" . &> /dev/null &
    break
  fi
done