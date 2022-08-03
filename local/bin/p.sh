#!/bin/bash

# Plays the video file given as argument with mpv 
# or vlc. Supports an option to mute the audio.

# I'm trying out more basic ways to check 
# CLI argument for the exercise.
# Getopt or "case" would be better.

usage() {
  echo "$(basename $0) [-m] <VIDEO_FILE>"
  echo ""
  echo "Plays provided video file using mpv or vlc"
  echo "Providing the -m argument mutes the audio"
}

MPLAYER=""
for player in mpv vlc;
do
  if type "$player" &> /dev/null; then
    MPLAYER="$player"
    break
  fi
done
if [[ -z $MPLAYER ]]; then
  echo "Missing any supported media player"
  echo "Please install mpv or vlc"
  exit 1
fi

ARGS=""
if [[ $1 == "-m" ]]; then
  case $MPLAYER in

    vlc)
      ARGS="--no-audio"
      ;;

    mpv)
      ARGS="--mute=yes"
      ;;

  esac
  shift
fi

if [[ -z $1 ]]; then
  usage
  exit 1
fi

"$MPLAYER" $ARGS $1 > /dev/null 2>&1 & 