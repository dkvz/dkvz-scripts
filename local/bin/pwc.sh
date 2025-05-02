#!/bin/sh

pwd | tr -d '\n' | xclip -sel clip
echo "Copied current directory to clipboard"
