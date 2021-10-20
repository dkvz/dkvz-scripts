#!/bin/bash

# Compress a directory, we're using 7z but we could check which archive
# utility is present in the path.

usage() {
  echo "$0 <DIRECTORY_TO_COMPRESS>"
  echo "Will create an archive with the same name as the source directory"
  echo "Please provide only one directory as the first argument"
  exit 0
}

success() {
  echo ""
  echo ""
  echo "Created archive file: $1"
}

[[ ! "$#" == 1 ]] && usage

[[ ! -d "$1" ]] && usage

ARCHIVE_NAME=`echo "$1" | perl -p -e 's/(^.*\/)?(\w+)\/?$/$2/'`
7z a "$ARCHIVE_NAME.7z" "$1" && success "$ARCHIVE_NAME.7z"