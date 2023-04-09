#!/bin/bash

curl -s wttr.in/$LOCATION?format=4 | awk '{ print "^c#d79921^"$6 "^c#ebdbb2^ "$7 }'
