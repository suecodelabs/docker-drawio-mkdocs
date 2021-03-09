#!/bin/bash

which docker > /dev/null || exit 1
which git > /dev/null || exit 2

git pull || exit 3

# Create/update container image and label 'mkdocs'
docker build -t mkdocs .
# Rebuild static mkdocs
docker run --rm --volume "$(pwd)":/srv/mkdocs -i mkdocs "./run-inside-container.sh"
