#!/bin/bash
set -e

domain=${1}
port=${2:-443}

certs_content=`ex +'/BEGIN CERTIFICATE/,/END CERTIFICATE/p' <(echo | openssl s_client -showcerts -connect ${domain}:${port} < /dev/null 2>/dev/null) -scq`
echo "${certs_content}" | sudo tee -a /usr/local/share/ca-certificates/${domain}.crt

sudo update-ca-certificates
