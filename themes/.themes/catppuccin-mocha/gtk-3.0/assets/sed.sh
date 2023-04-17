#!/bin/sh
sed -i \
         -e 's/#1E1E2E/rgb(0%,0%,0%)/g' \
         -e 's/#BAC2DE/rgb(100%,100%,100%)/g' \
    -e 's/#45475A/rgb(50%,0%,0%)/g' \
     -e 's/#F9E2AF/rgb(0%,50%,0%)/g' \
     -e 's/#1E1E2E/rgb(50%,0%,50%)/g' \
     -e 's/#BAC2DE/rgb(0%,0%,50%)/g' \
	"$@"
