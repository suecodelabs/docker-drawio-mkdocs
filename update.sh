#!/bin/bash

Log() {
  local MSG=$1
  local LEVEL="${2:-INFO}"

  echo "[${LEVEL}] ${MSG}"

  if [[ "${LEVEL}" == "ERROR" ]]; then
    exit 1
  fi
}


###
# Main
###
DOCS_DIR="${1:-$PWD}"
source /etc/os-release

# On Red Hat family systems, detect if selinux is enabled
# and set VOLUME_ARGS to :z
case "${NAME,,}" in
  fedora|redhat|centos)
    if [[ $(getenforce) == "Enforcing" ]]; then
      VOLUME_ARGS=":z"
    fi
  ;;
esac

if [[ $(which podman 2>/dev/null) ]]; then
  CRE="podman"
elif [[ $(which docker 2>/dev/null) ]]; then
  CRE="docker"
else
  Log "Could not find a container runtime like podman or docker" "ERROR"
fi

which git > /dev/null || Log "Git is not installed" "ERROR"
git pull || Log "Could not update the repository" "ERROR"

# Create/update container image and label 'mkdocs'
"${CRE}" build -t mkdocs .

# Rebuild static mkdocs
"${CRE}" run --rm --volume "${DOCS_DIR}:/srv/mkdocs${VOLUME_ARGS}" --name mkdocsrunner mkdocs
