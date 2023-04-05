#!/bin/bash

curl -s wttr.in/$LOCATION?format=1 | awk '{ print "^c#d79921^"$1 "^c#ebdbb2^ "$2 }'
