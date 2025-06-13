#!/bin/bash
# Goal: enable or disable the Gnome extension responsible for 
# showing the Desktop folder on the actual Gnome Desktop.

set -eux

DING_NAME="ding@rastersoft.com"

# Check if enabled:
if gnome-extensions show "$DING_NAME" | grep -q "Enabled: No"; then
  echo "Enabling desktop icons..."
  gnome-extensions enable "$DING_NAME"
else
  echo "Disabling desktop icons..."
  gnome-extensions disable "$DING_NAME"
fi
