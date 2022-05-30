#!/bin/bash

# Connect to RDP profile using Remmina.
# Will just open Remmina if the profile wasn't found.

# The place where connection files are may change 
# depending on your distro, currently in a variable
# below.

# Putting $PROFILES_PATH under quote won't expand the
# home directory "~" character.
PROFILES_PATH=~/.local/share/remmina/

PROFILE=`grep -rl "name=$1" $PROFILES_PATH | head -n 1`
# Check if a profile was found:
if [[ -z "$PROFILE" ]]; then
  echo "Profile wasn't found - Remember it's case sensitive!"
else
  echo "Found profile: $PROFILE"
  remmina -c "$PROFILE" > /dev/null 2>&1 &
fi