#!/bin/sh

# Requires mmdbinspect, jq and GeoIP databases

DB_DIR=/usr/share/GeoIP
ASN_DB_NAME=${DB_DIR}/GeoLite2-ASN.mmdb
CITY_DB_NAME=${DB_DIR}/GeoLite2-City.mmdb

if [[ $# -lt 1 ]]; then
  echo "Please provide an IP address as argument"
else
  #mmdblookup -f $CITY_DB_NAME --ip $1 country names en
  # mmdbinspect outputs a table because you can give it more than one
  # IP address to inspect. I think.
  mmdbinspect -db $CITY_DB_NAME $1 | jq '.[0].Records[0].Record.country.names.en'
fi