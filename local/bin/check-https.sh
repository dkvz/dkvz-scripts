#!/bin/bash

# Check the validity and date of expiry of the certificate related
# to the provided URL.

# TODO
# - Check what happens if URL is not https - Pretty sure I need kind of timeout

if [[ $# -lt 1 ]]; then
  echo "Please provide a host as the first argument"
  exit 1
fi

# Remove the possible http and https from the URL:
HNAME=`echo "$1" | sed 's#https\?:\/\/##'`

# s_client opens a connection and waits for your commands
# Using echo -n supposedly closes the connection afterwards.
CERT=`echo -n | openssl s_client -connect $HNAME:443 2>/dev/null`
if [[ $? -eq 0 ]]; then
  # I use xargs here because it trims leading spaces. Yeah.
  echo "$CERT" | grep "Verify return code" | xargs
  echo "$CERT" | openssl x509 -noout -dates
else
  echo "The provided hostname doesn't appear to exist"
  echo "Make sure it's a hostname and there is no trailing slash or other URL parts"
  exit 1
fi