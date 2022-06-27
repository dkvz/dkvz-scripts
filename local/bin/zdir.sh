#!/bin/bash

# Compress a directory, we're using 7z but we could check which archive
# utility is present in the path.

usage() {
  echo "$(basename $0) [-p] <DIRECTORY_TO_COMPRESS>"
  echo ""
  echo "Will create an archive with the same name as the source directory"
  echo "Please provide only one directory as the first argument"
  echo ""
  echo "The -p flag enables encryption of content and header"
  exit 0
}

success() {
  echo ""
  echo ""
  echo "Created archive file: $1"
}

# Accept options "h" and "p"
# The latter enables passwod encryption
ARGS=""
while getopts "hp" o; do
  case "${o}" in
  h)
    usage
    ;;
  p)
    ARGS="$ARGS -p -mhe=on"
    shift
    ;;
  *)
    usage
    ;;
  esac
done
#shift $((OPTIND-1))

[[ ! "$#" == 1 ]] && usage

[[ ! -d "$1" ]] && usage

ARCHIVE_NAME=`echo "$1" | perl -p -e 's/(^.*\/)?(\w+)\/?$/$2/'`
7z a "$ARCHIVE_NAME.7z" $ARGS "$1" && success "$ARCHIVE_NAME.7z"