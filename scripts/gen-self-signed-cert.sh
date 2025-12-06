#!/usr/bin/env bash
set -e

DOMAIN=$1

if [ -z "$DOMAIN" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ${DOMAIN}.key \
  -out ${DOMAIN}.crt \
  -subj "/CN=${DOMAIN}/O=assignment"

echo "Created ${DOMAIN}.key and ${DOMAIN}.crt"
