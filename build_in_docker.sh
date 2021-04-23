#!/bin/bash

set -eu -o pipefail

DOCKER_IMAGE=fedora_tex:33

if ! docker images --format "{{.Repository}}:{{.Tag}}" | grep -q ${DOCKER_IMAGE}; then
  docker build -t ${DOCKER_IMAGE} .
fi

mkdir -p results

docker run \
  -t \
  -v "$(pwd)":/repo \
  -w /repo \
  ${DOCKER_IMAGE} \
  /bin/bash -c "
    pdflatex -output-directory=results mmiotk-cv.tex \
    && chown -R $UID:$UID results
  "

# ChkTeX and lacheck
