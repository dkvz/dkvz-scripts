# Various scripts I use
Meant for Linux systems. Might work on Mac I don't know.

# Environment variables
Should be set in bashrc or default values will apply (use `export VARIABLE_NAME=value`).

None of these are mandatory. I think.

* DELETEME_FILE - Path to the throwable notepad text file (see n.sh)
* GUI_TEXT_EDITOR - Path to a graphical text editor to use
* WEB_BROWSER - Path to browser to use, usually defaults to `xdg-open`

# Installing
The script `install.sh` creates links to your working copy of this repo into `./local/bin`.

# TODO
- [x] IP location script: add a lookup in the ASN DB -> Done but that info seems completely worthless.
- [ ] RDP script: add option to list all the existing profiles.
- [ ] Check "TODO" inside of scripts.
- [ ] Remove my user from the docker group and use sudo in geoip-update.sh - The docker group is basically sudo without the password so I should not use it
