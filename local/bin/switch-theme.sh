#!/bin/bash

# TODO: Also change the tmux theme

VIMRC_PATH=~/.vimrc
CURRENT=$(gsettings get org.gnome.desktop.interface color-scheme)
GTK_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
ICON_THEME=$(gsettings get org.gnome.desktop.interface icon-theme)

replace_light_dark () {
  sed "s#$2#$3#" <<< "$1"
}

# Check that all of the values do end up with "light" or "dark"
for v in $CURRENT $GTK_THEME $ICON_THEME; do
  if [[ ! "$v" =~ (dark|light).?$ ]]; then
    echo "One of the Gnome theme value came out unexpected:"
    echo "$v"
    echo "We expect these values to end with 'light' or 'dark'"
    exit 1
  fi
done

# Check which theme we got
# Lot's of repeating stuff, could be optimized
if [[ "$CURRENT" != "'prefer-dark'" ]]; then
  # Switching to dark mode
  N_CURRENT=$(replace_light_dark "$CURRENT" "light" "dark")
  N_GTK_THEME=$(replace_light_dark "$GTK_THEME" "light" "dark")
  N_ICON_THEME=$(replace_light_dark "$ICON_THEME" "light" "dark")
  sed -i "s#=light#=dark#" "$VIMRC_PATH"
else
  # Switching to dark mode
  N_CURRENT=$(replace_light_dark "$CURRENT" "dark" "light")
  N_GTK_THEME=$(replace_light_dark "$GTK_THEME" "dark" "light")
  N_ICON_THEME=$(replace_light_dark "$ICON_THEME" "dark" "light")
  sed -i "s#=dark#=light#" "$VIMRC_PATH"
fi

# Set the new values for Gnome:
gsettings set org.gnome.desktop.interface color-scheme "$N_CURRENT"
gsettings set org.gnome.desktop.interface gtk-theme "$N_GTK_THEME"
# Changing the icon theme doesn't work that well on my Ubuntu
#gsettings set org.gnome.desktop.interface icon-theme "$N_ICON_THEME"

echo "Done."
echo "Reload vim config (or restart) if vim is opened."

