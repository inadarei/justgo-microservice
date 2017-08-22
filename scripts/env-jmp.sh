#!/usr/bin/env sh
set -e

export goDir="$(go list -e -f '{{.ImportComment}}' 2>/dev/null || true)"
OLD_PATH=${PWD}
cd "${GOPATH}/src/${goDir}"

${@}

cd $OLD_PATH
