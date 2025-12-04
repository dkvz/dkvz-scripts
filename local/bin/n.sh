#!/bin/sh

# Opens my "deleteme" text file where I enter all kind of things that I acknowledge can be lost.
# But not too early.
# It's a little weird. I'm a little weird.

DEFAULT_PATH=~/Desktop/deleteme.md
SCRATCH_DEFAULT_PATH=~/Desktop/scratch.md
DEFAULT_EDITOR=gedit
DME_PATH="${DELETEME_FILE:-$DEFAULT_PATH}"
S_PATH="${SCRATCH_PATH:-$SCRATCH_DEFAULT_PATH}"
case "$1" in
  -v|v)
    vi "$DME_PATH"
    ;;
  -sv|sv)
    vi "$S_PATH"
    ;;
  -nv|nv)
    nvim "$DME_PATH"
    ;;
  -snv|snv)
    nvim "$S_PATH"
    ;;
  *)
    EDITOR_TO_RUN="${GUI_TEXT_EDITOR:-$DEFAULT_EDITOR}"
    $EDITOR_TO_RUN "$DME_PATH" > /dev/null 2>&1 & 
    ;;
esac
