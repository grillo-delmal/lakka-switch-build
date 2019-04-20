#!/bin/bash

set -e
set -x

docker build -t lakka:latest .
docker run --rm \
    -v $(pwd)/Lakka-LibreELEC:/opt/lakka \
    -w /opt/lakka \
    --user $(id -u):$(id -g) \
    -e DISTRO="Lakka" \
    -e PROJECT="Switch" \
    -e DEVICE="Switch-L4T" \
    -e ARCH="aarch64" \
    -ti lakka:latest \
    make image -j 4
