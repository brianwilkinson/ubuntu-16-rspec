#!/usr/bin/env bash

CERTFILE=$1
FINGEPRINT=$2

echo "CERTFILE   = ${CERTFILE}"
echo "FINGEPRINT = ${FINGEPRINT}"

openssl x509 -noout -fingerprint -sha256 -in ${CERTFILE}  2>/dev/null | grep --silent "${FINGEPRINT}"

if [ $? -ne 0 ]; then
    echo "X509 Certificate fingerprint does not match - KEY VERIFICATION FAILED"
    openssl x509 -noout -fingerprint -sha256 -in ${CERTFILE} | grep "Fingerprint"
    exit 1
else
    echo "X509 Certificate fingerprint matches - key verification success"
fi
