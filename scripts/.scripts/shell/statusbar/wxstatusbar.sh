#!/bin/bash

ICON_COLOR="^c#d79921^"
TEXT_COLOR="^c#ebdbb2^"

curl -s wttr.in/$LOCATION?format=4 | awk '{ print "^c#d79921^"$6 "^c#ebdbb2^ "$7 }'
