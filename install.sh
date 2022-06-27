#!/bin/bash

set -e

TARGET="${HOME}/.local/bin"
CONF_DIR="${HOME}/.local/etc"

read -p "Install in ${TARGET}? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo ""
  mkdir -p $CONF_DIR
  mkdir -pv $TARGET
  # TODO Check and warn if GeoIP DB files are absent
  ln -sfv "$PWD/local/bin/init-iplookup.sh" "$TARGET/init-iplookup.sh"
  ln -sfv "$PWD/local/bin/geoip-update-create-env.sh" "$TARGET/geoip-update-create-env"
  ln -sfv "$PWD/local/bin/geoip-update.sh" "$TARGET/geoip-update"
  ln -sfv "$PWD/local/bin/local-iplookup.sh" "$TARGET/local-iplookup"
  ln -sfv "$PWD/local/bin/iplookup.sh" "$TARGET/iplookup"
  ln -sfv "$PWD/local/bin/mmdbinspect" "$TARGET/mmdbinspect"
  ln -sfv "$PWD/local/bin/n.sh" "$TARGET/n"
  ln -sfv "$PWD/local/bin/e.sh" "$TARGET/e"
  ln -sfv "$PWD/local/bin/whatismyip.sh" "$TARGET/whatismyip"
  ln -sfv "$PWD/local/bin/zdir.sh" "$TARGET/zdir"
  ln -sfv "$PWD/local/bin/check-https.sh" "$TARGET/check-https"
  ln -sfv "$PWD/local/bin/vpn.sh" "$TARGET/vpn"
  ln -sfv "$PWD/local/bin/random-text.sh" "$TARGET/random-text"
  ln -sfv "$PWD/local/bin/oh.sh" "$TARGET/oh"
  ln -sfv "$PWD/local/bin/rdp.sh" "$TARGET/rdp"
  ln -sfv "$PWD/local/bin/ssh-old.sh" "$TARGET/ssh-old"
  ln -sfv "$PWD/local/bin/yt-audio.sh" "$TARGET/yt-audio"
  ln -sfv "$PWD/local/bin/yt-search.sh" "$TARGET/yt-search"
fi
