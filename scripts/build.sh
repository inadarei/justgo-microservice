#!/usr/bin/env sh
set -e

export goDir="$(go list -e -f '{{.ImportComment}}' 2>/dev/null || true)"
OLD_PATH=${PWD}
cd "${GOPATH}/src/${goDir}"

dep ensure
go-wrapper install

cd ${OLD_PATH}