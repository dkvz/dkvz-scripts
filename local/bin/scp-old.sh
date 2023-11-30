#!/bin/bash
# Copy paste of ssh-old.sh but for scp.

scp -oHostKeyAlgorithms=+ssh-rsa -oKexAlgorithms=+diffie-hellman-group1-sha1 "$@"
