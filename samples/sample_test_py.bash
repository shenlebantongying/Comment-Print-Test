#!/usr/bin/env bash

pwd=$(dirname "$0")

gcc -o "${pwd}/sample.exe" "${pwd}/sample.c"
chmod +x "${pwd}/sample.exe"

${pwd}/../cpt.py -s ${pwd}/sample.c -c ${pwd}/sample.exe
