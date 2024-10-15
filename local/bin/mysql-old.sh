#!/bin/bash

# Just a replacement to the mysql client that also
# works with older servers that do not have SSL 
# enabled.

mariadb --skip-ssl "$@"