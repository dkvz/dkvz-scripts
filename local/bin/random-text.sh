#!/bin/bash

usage() {
  echo "$0 [-w MAX_LINE_WIDTH] LINE_COUNT"
  echo "Generates LINE_COUNT lines of random text in lowercase"
  echo "Can be formatted to a specific column width, defaults to 75"
  exit 0
}

W=75
if getopts ":w:" o; then
  W=$OPTARG
  shift
  shift
fi

if [ -z $1 ]; then
  usage
fi

tr -dc a-z1-4 < /dev/urandom | tr 1-2 ' \n' | tr 3-4 ' ' | awk 'length==0 || length>50' | perl -p -e 's/(^ *| {2,})//g' | cat -s | fmt -w "$W" | head -n "$1"