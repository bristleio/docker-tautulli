#!/bin/bash

# get the manifest tool
curl -O -J -L https://github.com/estesp/manifest-tool/releases/download/v0.7.0/manifest-tool-linux-armv7

# chmod it
chmod +x manifest-tool-linux-armv7

# push the manifest
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/manifest-tool-linux-armv7 push from-spec $DIR/manifest.yaml
