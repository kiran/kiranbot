#!/bin/sh

BASEURL=${1:-https://kiranbot.com}
APP=$2

git clean -fdx public/
hugo -b "$BASEURL"
goapp deploy -application "$APP" app.yaml