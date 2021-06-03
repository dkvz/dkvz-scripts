#!/bin/sh

# Requires mmdbinspect, jq, whois and GeoIP databases

DB_DIR=/usr/share/GeoIP
ASN_DB_NAME=${DB_DIR}/GeoLite2-ASN.mmdb
CITY_DB_NAME=${DB_DIR}/GeoLite2-City.mmdb

if [[ $# -lt 1 ]]; then
  echo "Please provide an IP address as argument"
else
  #mmdblookup -f $CITY_DB_NAME --ip $1 country names en
  # mmdbinspect outputs a table because you can give it more than one
  # IP address to inspect. I think.
  SHORT_INFO=`mmdbinspect -db $CITY_DB_NAME $1 | jq '.[0].Records[0].Record' | jq '.country.names.en, .city.names.en'`
  # Echoing without quotes will remove the line feeds,
  # which is what I want.
  echo $SHORT_INFO
  # Get the range info from the ASN database:
  if [[ -f $ASN_DB_NAME ]]; then
    #ASN_SUBNET=`mmdbinspect -db $ASN_DB_NAME $1 | jq '.[0].Records[0].Network' | sed 's#"##g'`
    ASN=`mmdbinspect -db $ASN_DB_NAME $1`
    ASN_SUBNET=`echo "$ASN" | jq '.[0].Records[0].Network' | sed 's#"##g'`
    AS_NAME=`echo "$ASN" | jq '.[0].Records[0].Record.autonomous_system_organization' | sed 's#"##g'`
    echo "AS belongs to: ${AS_NAME}"
    echo "ASN Subnet: ${ASN_SUBNET}"
  fi
  # Get the range registered with RIPE
  # (will be the biggest possible range so careful when blocking that)
  SUBNET=`whois -b $1 | grep -o '[0-9]\+.[0-9]\+.[0-9]\+.[0-9]\+'`
  SUB_SINGLE_LINE=`echo "$SUBNET" | tr '\n' '-' | sed 's#-# - #g' | sed 's# - $##'`
  echo "RIPE Subnet: ${SUB_SINGLE_LINE}"
fi