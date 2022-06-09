# Connect to servers with "old" host key algorithms.
# Currently always assumes using RSA will work, RSS 
# might be needed in some cases.

ssh -oHostKeyAlgorithms=+ssh-rsa "$@"