#!/bin/bash

export DB_DIR=/usr/share/GeoIP
export ASN_DB_NAME=GeoLite2-ASN.mmdb
export CITY_DB_NAME=GeoLite2-City.mmdb

if [[ `type -P "iplookup-node"` ]]; then
  iplookup-node "$@"
else
  echo "You don't appear to have the iplookup binary in PATH"
  echo "Can be installed using "
  echo "npm install -g @dkvz/iplookup-cli"
fi