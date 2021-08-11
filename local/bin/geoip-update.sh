#!/bin/bash

# - Check if the env file exists, mention the geoip-update-create-env script if not.

# We need the global iplookup vars
source init-iplookup.sh

# Where we write the env file:
CONF_DIR="${HOME}/.local/etc"
# env file name:
GEO_UPDATE_ENV_FILE="geoip.env"
GEO_EDITIONS_DEFAULT="GeoIP2-City GeoIP2-ASN"
GEO_UPDATE_ENV_FULLPATH=${CONF_DIR}/${GEO_UPDATE_ENV_FILE}

if [ ! -f $GEO_UPDATE_ENV_FULLPATH ]; then
  echo "The env file for the docker container appears to be missing."
  echo "You can use the script "
  echo "geoip-update-create-env"
  echo "to create it."
  exit 1
fi

docker run --rm --env-file "$GEO_UPDATE_ENV_FULLPATH" -v "$DB_DIR":/usr/share/GeoIP maxmindinc/geoipupdate