# Disables public key auth. I have way too many keys and get
# blocked because of too many attemps.

ssh -o PubkeyAuthentication=no "$@"