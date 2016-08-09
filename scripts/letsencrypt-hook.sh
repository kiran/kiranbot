#!/bin/bash

set -e

ARG="$1"; shift
DOMAIN="$1"; shift
PRIVKEY="$1"; TOKEN_FILENAME="$1"; shift
CERT="$1"; TOKEN_CONTENT="$1"; shift
CHAIN="$1"; shift||true

echo $ARG
echo $DOMAIN
echo $TOKEN_FILENAME
echo $TOKEN_CONTENT

case "$ARG" in
    deploy_challenge)
        cat >letsencrypt.go <<EOF
package letsencrypt

import (
        "fmt"
        "net/http"
)

var challenges = map[string]string{
        "$TOKEN_FILENAME": "$TOKEN_CONTENT",
}

func init() {
        for challenge, response := range challenges {
                http.HandleFunc("/.well-known/acme-challenge/"+challenge, respond(response))
        }
}

func respond(response string) func(w http.ResponseWriter, r *http.Request) {
        return func(w http.ResponseWriter, r *http.Request) {
                fmt.Fprint(w, response)
        }
}
EOF
        make deploy
        ;;

    clean_challenge)
        rm -f letsencrypt.go
        ;;

    deploy_cert)
        echo "Now open a browser window at the following URLs:"
        echo "   https://console.cloud.google.com/appengine/settings/certificates?project=kiranbotblog&moduleId=default&versionId=1"
        echo "and hit 'Upload new cert', then paste the thing I just copied into the 'public key' field"
        pbcopy < "$CHAIN"
        echo "...Press enter when you're done pasting"
        read

        echo "Now go and paste the thing I'm copying into the 'private key' field"
        openssl rsa -inform pem -in "$PRIVKEY" -outform pem | pbcopy
        ;;

    *)
        echo "I don't know what that means: $ARG"
        exit 1
        ;;
esac