#!/bin/sh

# Really weird script to switch the background of my 
# Ghostty terminal by changing a link on the filesystem.

# Where I store the background images:
BG_DIR=~/.local/share/backgrounds
# Where to save the link (directory - Will create if missing):
LINK_DIR=~/.local/share
LINK_NAME="bg.jpg"

if [ ! -d "$LINK_DIR" ]; then
  mkdir -p "$LINK_DIR"
fi

# We currently only support jpg. I could use an or and pngs
# but then the link filename is wrong (not sure if ghostty 
# cares or not).
IMG=$(find "$BG_DIR" -type f -name "*.jpg" | shuf | head -n 1)

echo "Switching to $IMG"
# Force re-create the link:
ln -sfv "$IMG" "$LINK_DIR/$LINK_NAME"
