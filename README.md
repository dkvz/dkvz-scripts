# Some scripts I started gathering

# Environment variables I use
Should be set in bashrc or default values will apply (use `export VARIABLE_NAME=value`).

* DELETEME_FILE - Path to the throwable notepad text file (see n.sh)
* WEB_BROWSER - Path to browser to use, usually defaults to `xdg-open`

# Installing
The script `install.sh` creates links to your working copy of this repo into `./local/bin`.

# TODO
- [x] IP location script: add a lookup in the ASN DB -> Done but that info seems completely worthless.
- [ ] RDP script: add option to list all the existing profiles.
- [ ] Check "TODO" inside of scripts.
- [ ] Remove my user from the docker group and use sudo in geoip-update.sh - The docker group is basically sudo without the password so I should not use it