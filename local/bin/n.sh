#!/bin/sh

# Opens my "deleteme" text file where I enter all kind of things that I acknowledge can be lost.
# But not too early.
# It's a little weird. I'm a little weird.

DEFAULT_PATH=~/Desktop/deleteme.md
DEFAULT_EDITOR=gedit
DME_PATH="${DELETEME_FILE:-$DEFAULT_PATH}"
case "$1" in
  -v|v)
    vi "$DME_PATH"
    ;;
  -nv|nv)
    nvim "$DME_PATH"
    ;;
  *)
    EDITOR_TO_RUN="${GUI_TEXT_EDITOR:-$DEFAULT_EDITOR}"
    $EDITOR_TO_RUN "$DME_PATH" > /dev/null 2>&1 & 
    ;;
esac
