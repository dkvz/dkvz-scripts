#!/bin/bash

# For the moment, just opens Github in a browser.
# At some point I should allow searching.

DEFAULT_BROWSER=xdg-open
BROWSER="${WEB_BROWSER:-$DEFAULT_BROWSER}"

$BROWSER "https://github.com"