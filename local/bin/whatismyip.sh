#!/bin/bash

# TODO check for error in $? and explain that Internet 
# is probably down.
curl -s checkip.dyndns.org | grep -oP "\d+\.\d+\.\d+\.\d+"