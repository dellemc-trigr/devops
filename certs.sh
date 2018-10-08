#!/bin/bash
set -e

address=${1}

certs_content=`ex +'/BEGIN CERTIFICATE/,/END CERTIFICATE/p' <(echo | openssl s_client -showcerts -connect ${address} < /dev/null 2>/dev/null) -scq`
echo "${certs_content}" | sudo tee -a /usr/local/share/ca-certificates/${address}.crt

sudo update-ca-certificates
