#!/usr/bin/env bash

KEYFILE=$1
FINGEPRINT=$2

echo "KEYFILE    = ${KEYFILE}"
echo "FINGEPRINT = ${FINGEPRINT}"

gpg --batch --with-fingerprint ${KEYFILE} 2>/dev/null | grep --silent "${FINGEPRINT}"

if [ $? -ne 0 ]; then
    echo "GPG Key fingerprint does not match - KEY VERIFICATION FAILED"
    gpg --with-fingerprint ${KEYFILE} | grep "Key fingerprint"
    exit 1
else
    echo "GPG Key fingerprint matches - key verification success"
fi
