#!/usr/bin/env bash

set -o errexit
set -o pipefail

docker run \
    -it \
    --rm -v $(pwd):/build \
    -w /build \
    goreleaser/goreleaser \
    check \
	--config "goreleaser/vault-health-checker.yml"

docker run \
    -it \
    --rm -v $(pwd):/build \
    -e GITHUB_TOKEN \
    -w /build \
    goreleaser/goreleaser \
    release \
    --rm-dist \
	--config "goreleaser/vault-health-checker.yml"
