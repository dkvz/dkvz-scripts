#!/bin/bash

# 1. Check if yt-dlp is present
# 2. Download m4a format
# 3. Provide the list of formats if it didn't work

# Expect single argument (use basename)

usage() {
  echo "$(basename $0) <YOUTUBE_URL>"
  echo ""
  echo "Attempts to download m4a audio-only format for given URL"
}

if [[ -z "$1" ]]; then
  echo "No URL provided."
  usage
  exit 1
fi

if [[ `type -P "iplookup-node"` ]]; then
  yt-dlp -f m4a "$1"
  if [ ! $? -eq 0 ]; then
    echo "Failed to download m4a format"
    echo "Attempting to list possible formats for manual use:"
    yt-dlp -F "$1"
  fi
else
  echo "Missing yt-dlp"
  echo "Can be downloaded using pip (sometimes pip3) or package managers"
fi