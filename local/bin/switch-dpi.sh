#!/bin/sh

# Change DPI settings from high to semi-high
# Script only makes sense for my exact setup
# only (I use dash-to-panel for instance).

TEXT_SCALING_HIGH="1.3"
TEXT_SCALING_LOW="1.0"

TEXT_SCALING_CURRENT=$(gsettings get org.gnome.desktop.interface text-scaling-factor)

set_dash_to_panel_size() {
  # There's no validity control on the argument here.
  gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas/ set org.gnome.shell.extensions.dash-to-panel panel-size "$1"
}

if [ "$TEXT_SCALING_CURRENT" = "$TEXT_SCALING_HIGH" ]; then
  echo "Current DPI mode is high, setting to low"
  gsettings set org.gnome.desktop.interface text-scaling-factor "$TEXT_SCALING_LOW"
  set_dash_to_panel_size 32
  reset-dash-to-panel
elif [ "$TEXT_SCALING_CURRENT" = "$TEXT_SCALING_LOW" ]; then
  echo "Current DPI mode is low, setting to high"
  gsettings set org.gnome.desktop.interface text-scaling-factor "$TEXT_SCALING_HIGH"
  set_dash_to_panel_size 40
  reset-dash-to-panel
else
  echo "Unknown current DPI level of $TEXT_SCALING_CURRENT - Aborting"
fi
