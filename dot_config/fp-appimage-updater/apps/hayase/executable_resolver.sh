#!/usr/bin/env bash

set -euo pipefail

YAML_DATA=$(curl -sL "https://api.hayase.watch/files/latest-linux.yml")

VERSION=$(echo "$YAML_DATA" | yq ".version")
FILENAME=$(echo "$YAML_DATA" | yq ".path")

if [ -z "$FILENAME" ]; then
  FILENAME="linux-hayase-${VERSION}-linux.AppImage"
fi

DOWNLOAD_URL="https://api.hayase.watch/files/${FILENAME}"

# The updater expects "DOWNLOAD_URL" then "VERSION" on consecutive lines of stdout:
echo "$DOWNLOAD_URL"
echo "$VERSION"
