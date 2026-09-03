#!/bin/bash

# Scripts stands for "read page"
# Give it a URL, will use wget to download the content
# (wget follows redirections so it's cool)
# Hopefuly check that it's HTML
# Transform it into markdown
# Open the markdown in some editor

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <url>" >&2
  echo "Attempts to fetch given URL, convert to markdown then open in editor" >&2
  exit 1
fi

url="$1"
tmpfile=$(mktemp /tmp/rp.XXXXXX.html)
trap 'rm -f "$tmpfile"' EXIT

if wget -q -O "$tmpfile" "$url"; then
  mime=$(file --mime-type -b "$tmpfile")
  if [[ "$mime" != "text/html" && "$mime" != "application/xhtml+xml" ]]; then
    echo "Content doesn't seem to be HTML (mime type: $mime)" >&2
    exit 1
  fi

  mdfile=$(mktemp /tmp/rp.XXXXXX.md)
  trap 'rm -f "$tmpfile" "$mdfile"' EXIT

  html2text "$tmpfile" >"$mdfile"
  nvim "$mdfile"
else
  echo "Failed to download URL - Check that it's correct" >&2
fi
