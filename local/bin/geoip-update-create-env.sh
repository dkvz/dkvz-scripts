#!/bin/bash

# Create the config file with environment variables that my GeoIP update script uses.
# The API key is somewhat secret but I won't bother encrypting it.
# I don't see what horrible thing could be done with my GeoIP API key.
# Otherwise, 7z could be used for encryption (openssl too).

# Where we write the env file:
CONF_DIR="${HOME}/.local/etc"
# env file name:
GEO_UPDATE_ENV_FILE="geoip.env"
# Get the shared IP lookup vars for default values:
source init-iplookup.sh

# The -s flag tells read that it's supposed to be a secret
read -s -p 'Enter GeoIP licence key:' GEO_KEY

echo "SCRIPT ISN'T FINISHED"