#!/bin/sh

DB_DIR=/usr/share/GeoIP
DEST_BASE=/usr/share

if [[ -z $1 ]]; then
  echo "Provide the SCP destination in argument (without target directory)"
else
  scp -r "$DB_DIR" "$1:$DEST_BASE"
fi