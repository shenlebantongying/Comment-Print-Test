#!/usr/bin/env bash

pwd=$(dirname "$0")

${pwd}/samples/build.bash
${pwd}/spt.py -s ./samples/sample.c -c ./samples/sample.exe
