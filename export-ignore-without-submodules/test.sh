#!/bin/bash

set -euo pipefail

nix flake lock --update-input curl

EXPECTED_NAR_HASH="sha256-O44+xtDb2tQC3fWAf8DCoGpCzuEua9watccodNPZHVg="
NAR_HASH="$(jq -r .nodes.curl.locked.narHash flake.lock)"

[[ "$NAR_HASH" == "$EXPECTED_NAR_HASH" ]] || echo FAIL
