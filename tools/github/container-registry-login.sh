#!/bin/bash

cd "$(dirname "$0")" || exit

# You will need a PAT to pull the images locally see: https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry

echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin