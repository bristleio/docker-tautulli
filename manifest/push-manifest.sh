#!/bin/bash

# get the manifest tool
curl -O -J -L https://github.com/estesp/manifest-tool/releases/download/v0.7.0/manifest-tool-linux-armv7

# chmod it
chmod +x manifest-tool-linux-armv7

# push the manifest
./manifest-tool-linux-armv7 push from-spec manifest.yaml

