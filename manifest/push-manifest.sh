#!/bin/bash

# get the manifest tool
curl -O -J -L https://github.com/estesp/manifest-tool/releases/download/v0.7.0/manifest-tool-linux-amd64

# chmod it
chmod +x manifest-tool-linux-amd64
ls

# push the manifest
manifest-tool-linux-amd64 push from-spec manifest.yaml
