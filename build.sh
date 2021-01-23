#!/bin/bash
set -e

export DOCKER_BUILDKIT=1

DOCKER_REPO=${1:-balenablocks}
REPO_NAME="fbcp"

DISPLAYS=" \
    adafruit-hx8357d-pitft \
    adafruit-ili9341-pitft \
    freeplaytech-waveshare32b \
    waveshare35b-ili9486 \
    tontec-mz61581 \
    waveshare-st7789vw-hat \
    waveshare-st7735s-hat \
    kedei-v63-mpi3501 \
    dtoverlay \
"

for display in $DISPLAYS
do
    echo "building $DOCKER_REPO/$REPO_NAME:$display..."
    docker build . \
        --build-arg "FBCP_DISPLAY=$display" \
        --tag "$DOCKER_REPO/$REPO_NAME:$display"
done

echo "building $DOCKER_REPO/$REPO_NAME:latest..."
docker build . -f Dockerfile.all --tag "$DOCKER_REPO/$REPO_NAME:latest"