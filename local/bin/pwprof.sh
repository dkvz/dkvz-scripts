#!/bin/bash

# Goal: change and query the power profile
# It can be done with powerprofilesctl, I 
# just wanted a slightly shorter way to do 
# it and swap between balanced and power-saver.

# Power profiles behave a bit differently on 
# battery power.

usage() {
  echo "$(basename "$0") [up|down]"
  echo ""
  echo "Without arguments, outputs the current power profile"
  echo "Otherwise, bumps it up or down between balanced and power saver"
  echo "u or d can be used instead of up and down"
  exit 0
}

# Check if we got the powerprofilesctl utility 
if ! type powerprofilesctl > /dev/null 2>&1; then
  echo "Missing the powerprofilesctl utility"
  echo "You might need to install the power-profiles-daemon"
  exit 1
fi

case "$1" in
  u|up)
    powerprofilesctl set balanced 
    ;;
  d|down)
    powerprofilesctl set power-saver
    ;;
  h|-h)
    usage
    ;;
esac

CURPROF=$(powerprofilesctl get)
echo "Current profile is $CURPROF"
