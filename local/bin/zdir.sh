#!/bin/bash

# Compress a directory, we're using 7z but we could check which archive
# utility is present in the path.

usage() {
  echo "$(basename $0) [-z] [-p] <DIRECTORY_TO_COMPRESS>"
  echo ""
  echo "Will create an archive with the same name as the source directory"
  echo "Please provide only one directory as the first argument"
  echo ""
  echo "The default format is 7z, but the -z option will create a .zip"
  echo "archive instead."
  echo ""
  echo "The -p flag enables encryption of content and header"
  exit 0
}

success() {
  echo ""
  echo ""
  echo "Created archive file: $1"
}

# Accept options "h" "p" and "z"
MODE="7z"
ENCRYPT=0
while getopts "hzp" o; do
  case "${o}" in
  h)
    usage
    ;;
  z)
    MODE="zip"
    ;;
  p)
    ENCRYPT=1
    ;;
  ?)
    usage
    ;;
  esac
done
shift $((OPTIND-1))

[[ ! "$#" == 1 ]] && usage

[[ ! -d "$1" ]] && usage

ARCHIVE_NAME=`echo "$1" | perl -p -e 's/(^.*\/)?(\w+)\/?$/$2/'`
if [[ $MODE == "7z" ]]; then
  ARGS=""
  [[ $ENCRYPT -eq 1 ]] && ARGS="$ARGS -p -mhe=on"
  7z a "$ARCHIVE_NAME.7z" $ARGS "$1" && success "$ARCHIVE_NAME.7z"
else
  # Expecting zip mode
  ARGS="-r"
  [[ $ENCRYPT -eq 1 ]] && ARGS="-re"
  zip $ARGS "$ARCHIVE_NAME.zip" "$1" && success "$ARCHIVE_NAME.zip"
fi
