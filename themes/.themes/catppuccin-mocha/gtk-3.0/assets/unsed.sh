#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#1E1E2E/g' \
         -e 's/rgb(100%,100%,100%)/#BAC2DE/g' \
    -e 's/rgb(50%,0%,0%)/#45475A/g' \
     -e 's/rgb(0%,50%,0%)/#F9E2AF/g' \
 -e 's/rgb(0%,50.196078%,0%)/#F9E2AF/g' \
     -e 's/rgb(50%,0%,50%)/#1E1E2E/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#1E1E2E/g' \
     -e 's/rgb(0%,0%,50%)/#BAC2DE/g' \
	"$@"
