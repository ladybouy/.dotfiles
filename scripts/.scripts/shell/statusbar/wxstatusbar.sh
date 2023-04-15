#!/bin/bash

ICON_COLOR="^c#d79921^"
TEXT_COLOR="^c#ebdbb2^"

curl -s wttr.in/$LOCATION?format=1 | awk '{ print "^c#d79921^"$1 "^c#ebdbb2^ "$2 }'
