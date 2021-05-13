#!/usr/bin/env bash

pwd=$(dirname "$0")

gcc -o "${pwd}/sample.exe" "${pwd}/sample.c"
chmod +x "${pwd}/sample.exe"