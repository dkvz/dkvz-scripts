#!/bin/bash

usage() {
  echo "$(basename $0) -s <start_time> -t <end_time> <video_file>"
  echo ""
  echo "Cut video from given start time to end time"
  echo "Both arguments can be omitted to use the start"
  echo "or end of the video respectively."
  exit 0
}

# Check options:
ARGS=" "
while getopts "hs:t:" o; do
  case "${o}" in
  h)
    usage
    ;;
  s)
    ARGS="$ARGS -ss $OPTARG"
    ;;
  t)
    ARGS="$ARGS -to $OPTARG"
    ;;
  ?)
    usage
    ;;
  esac
done
shift $((OPTIND-1))

# Create candidate filename and check that
# it doesn't exist already.
FILENAME="$1"
if [[ ! -f $FILENAME ]]; then
  usage
fi

EXT="${FILENAME##*.}"
NEW_FILE="${FILENAME%.*}_c.$EXT"
if [[ -f "$NEW_FILE" ]]; then
  echo "Candidate edited file $NEW_FILE already exists"
  echo "This script won't override it, delete the file manually beforehand."
  exit 1
fi

if ffmpeg $ARGS -i "$FILENAME" -c copy "$NEW_FILE"; then
  echo "File cut done"
  # Ask to remove original file (defaults to no)
  read -p "Remove file $FILENAME? (CAREFUL) [y/N]" -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]; then
	  rm -v "$FILENAME"
  fi
fi



