#!/usr/bin/env sh
# set -e

export goDir="$(go list -e -f '{{.ImportComment}}' 2>/dev/null || true)"
OLD_PATH=`pwd`
cd "${GOPATH}/src/${goDir}"

dep ensure
fresh -c scripts/runner.conf

# cd ${OLD_PATH}