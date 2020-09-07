#!/bin/sh

set -eu

CMD="make"
IMAGE="tex:latest"
WORKDIR="/wd"

if [ $# = 1 ]; then
  if [ "$1" = "clean" ]; then
    CMD="make clean"
  fi
fi

docker run --rm                             \
           --volume "${PWD}":"${WORKDIR}"   \
           --workdir "${WORKDIR}"           \
           "${IMAGE}"                       \
           /bin/sh -c "${CMD}"
