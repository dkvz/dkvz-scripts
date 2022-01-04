#!/bin/bash

# Script to connect VPNs that are already registered in NetworkManager.
# Uses the NetworkManager CLI.

# TODO We could acutally list the VPN connection names by querying
# nmcli
if [[ $# -lt 2 ]]; then
  echo "USAGE:"
  SCRIPT_NAME=`basename $0`
  echo "$SCRIPT_NAME [VPN NAME] [up|down]"
  exit 1
fi

if ! type nmcli > /dev/null 2>&1; then
  echo "Missing the nmcli utility - This command only works with NetworkManager"
  exit 1
fi

nmcli con "$2" "$1"