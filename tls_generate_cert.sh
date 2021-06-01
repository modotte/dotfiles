#!/bin/sh

# Generate SSL key and certificate.

if [ -z "$(command -v openssl)" ];then
    printf "[ERROR] No openssl executable found.\n" >&2
    exit 1
fi

openssl req -x509 -newkey rsa:4096 -keyout key.pem \
        -out cert.pem -days 365 -nodes

exit
