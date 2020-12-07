#!/bin/bash
# 
function qrfun {
    read -r realm; read -r url; url=$(echo "$url" | tr -d '\r')
    while read -r line; do echo "$line"; done
    echo; echo "$realm"

    while [ -z "$line" ]; do sleep 1; echo -n .; line=$(curl "$url" -sk); done < <(curl "$url" -sk)
    QRID_AUTH_RESULT=$line
}

qrfun < <(curl -s "https://12id.eu/p/embed$" -d "&redirect_uri=http://localhost:80&client_id=test")

echo
echo R: "$QRID_AUTH_RESULT"
export QRID_AUTH_RESULT
