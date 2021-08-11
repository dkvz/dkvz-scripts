#!/bin/bash

# Create the config file with environment variables that my GeoIP update script uses.
# The API key is somewhat secret but I won't bother encrypting it.
# I don't see what horrible thing could be done with my GeoIP API key.
# Otherwise, 7z could be used for encryption (openssl too).

# Where we write the env file:
CONF_DIR="${HOME}/.local/etc"
# env file name:
GEO_UPDATE_ENV_FILE="geoip.env"
GEO_EDITIONS_DEFAULT="GeoIP2-City GeoIP2-ASN"
GEO_UPDATE_ENV_FULLPATH=${CONF_DIR}/${GEO_UPDATE_ENV_FILE}

echo "The current script is aimed to create an env file for the geoip-update script, which requires docker"
echo "Would create the file:"
echo ${GEO_UPDATE_ENV_FULLPATH}
echo ""

read -n 1 -p "Do you want to continue? [n] " RESP
if ! [[ $RESP =~ ^[yY] ]]; then
  exit 0
fi

echo ""
read -p "Enter your account ID: " GEOIPUPDATE_ACCOUNT_ID
# The -s flag tells read that it's supposed to be a secret
read -s -p "Enter GeoIP licence key: " GEOIPUPDATE_LICENSE_KEY
echo ""
read -p "Enter space separated edition IDs [${GEO_EDITIONS_DEFAULT}]: " GEOIPUPDATE_EDITION_INPUT

# We can probably do this as a single line above.
GEOIPUPDATE_EDITION_ID=${GEOIPUPDATE_EDITION_INPUT:-$GEO_EDITIONS_DEFAULT}

cat > ${GEO_UPDATE_ENV_FULLPATH} <<EOL
GEOIPUPDATE_ACCOUNT_ID=$GEOIPUPDATE_ACCOUNT_ID
GEOIPUPDATE_LICENSE_KEY=$GEOIPUPDATE_LICENSE_KEY
GEOIPUPDATE_EDITION_ID=$GEOIPUPDATE_EDITION_ID
EOL

echo "Written ${GEO_UPDATE_ENV_FULLPATH}"