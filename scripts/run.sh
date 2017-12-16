#!/usr/bin/env sh
# set -e

dep ensure
dep ensure -update
fresh -c scripts/runner.conf
