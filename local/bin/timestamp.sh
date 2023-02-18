#!/bin/bash

# TODO: Add help on "-h"

usage() {
  echo "$(basename $0) [-t <timestamp>]"
  echo ""
  echo "When used with no arguments, prints out current timestamp"
  echo "With argument -t, converts given timestamp to date"
  exit 0
}

while getopts "ht:" o; do
  case "${o}" in
  h)
    usage
    ;;
  t)
    date -d @$OPTARG
    exit 0
    ;;
  esac
done

date +"%s"