#!/bin/bash

set -e

TARGET="${HOME}/.local/bin"

read -p "Install in ${TARGET}? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo ""
  mkdir -pv $TARGET
  # TODO Check and warn if GeoIP DB files are absent
  ln -sfv "$PWD/local/bin/local-iplookup.sh" "$TARGET/local-iplookup"
  ln -sfv "$PWD/local/bin/mmdbinspect" "$TARGET/mmdbinspect"
  ln -sfv "$PWD/local/bin/n.sh" "$TARGET/n"
  ln -sfv "$PWD/local/bin/e.sh" "$TARGET/e"
fi
