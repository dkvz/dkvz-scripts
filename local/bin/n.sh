#!/bin/sh

# Opens my "deleteme" text file where I enter all kind of things that I acknowledge can be lost.
# But not too early.
# It's a little weird. I'm a little weird.

DEFAULT_PATH=~/Desktop/deleteme.md
DME_PATH="${DELETEME_FILE:-$DEFAULT_PATH}"

gedit $DME_PATH > /dev/null 2>&1 &