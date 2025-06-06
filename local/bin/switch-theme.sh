#!/bin/bash

# TODO: Also change the tmux theme
# and the neovim one

# Adding quotes will prevent ~ expansion
VIMRC_PATH=~/.vimrc
VSCODE_PATH=~/.config/Code/User/settings.json
# I made Neovim read that file (only on Linux)
# to determine color scheme
# I went too far in some places
LIGHT_STATE_FILE=~/.local/state/dkvz_colorscheme_light
# The extensions have to be installed, of course:
VSCODE_DARK="Gruvbox Material Dark"
VSCODE_LIGHT="Catppuccin Latte"
CURRENT=$(gsettings get org.gnome.desktop.interface color-scheme)
GTK_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
ICON_THEME=$(gsettings get org.gnome.desktop.interface icon-theme)

if [[ -n "$DKVZ_THEME" ]]; then
  echo "Specific theme set, theme switching disabled"
  exit 2
fi

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

echo "Current theme is $CURRENT"

# Check which theme we got
# Lot's of repeating stuff, could be optimized
if [[ "$CURRENT" != "'prefer-dark'" ]]; then
  # Switching to dark mode
  N_CURRENT=$(replace_light_dark "$CURRENT" "light" "dark")
  N_GTK_THEME=$(replace_light_dark "$GTK_THEME" "light" "dark")
  #N_ICON_THEME=$(replace_light_dark "$ICON_THEME" "light" "dark")
  sed -i "s#=light#=dark#" "$VIMRC_PATH"
  sed -i "s#$VSCODE_LIGHT#$VSCODE_DARK#" "$VSCODE_PATH"
  rm -f $LIGHT_STATE_FILE 
else
  # Switching to light mode
  N_CURRENT=$(replace_light_dark "$CURRENT" "dark" "light")
  N_GTK_THEME=$(replace_light_dark "$GTK_THEME" "dark" "light")
  #N_ICON_THEME=$(replace_light_dark "$ICON_THEME" "dark" "light")
  sed -i "s#=dark#=light#" "$VIMRC_PATH"
  sed -i "s#$VSCODE_DARK#$VSCODE_LIGHT#" "$VSCODE_PATH"
  # I write a theme name in there but nvim probably doesn't read it
  echo "shine" > $LIGHT_STATE_FILE
fi

# Set the new values for Gnome:
gsettings set org.gnome.desktop.interface color-scheme "$N_CURRENT"
gsettings set org.gnome.desktop.interface gtk-theme "$N_GTK_THEME"
# Changing the icon theme doesn't work that well on my Ubuntu
#gsettings set org.gnome.desktop.interface icon-theme "$N_ICON_THEME"

echo "Done."
echo "Reload vim config (or restart) if vim is opened."

