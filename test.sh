#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"distroless.dev/git"}
CLONE_URL=${CLONE_URL:-"https://github.com/distroless/git.git"}

rm -rf smoketest
mkdir smoketest
chmod go+wrx smoketest

# TODO: re-enable this
# has a permissions issue
#trap "rm -rf smoketest" EXIT

# Try cloning a repo and check for README.md
docker run --rm -v "${PWD}/smoketest":/w -w /w $IMAGE_NAME clone --depth 1 $CLONE_URL .
find smoketest/README.md
