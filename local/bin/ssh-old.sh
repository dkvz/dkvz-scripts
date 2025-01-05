# Connect to servers with "old" host key algorithms.
# Currently always assumes using RSA will work, RSS 
# might be needed in some cases.

ssh -oPubkeyAcceptedKeyTypes=+ssh-rsa -oHostKeyAlgorithms=+ssh-rsa -oKexAlgorithms=+diffie-hellman-group1-sha1 "$@"