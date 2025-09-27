#!/bin/bash
# The dash-to-panel Gnome extension sometimes disappears when I use
# my terminal fullscreen. No idea why. Disabling then enabling gets 
# it back.

set -eux

EXT_NAME="dash-to-panel@jderose9.github.com"

gnome-extensions disable "$EXT_NAME"
gnome-extensions enable "$EXT_NAME"
