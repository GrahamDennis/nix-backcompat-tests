#!/bin/bash

set -euo pipefail

nix flake lock --update-input curl

EXPECTED_NAR_HASH="sha256-NGVF5fEb/vK8VnLIrP80P/cOYbURf/nS3VVrZA9AXGo="
NAR_HASH="$(jq -r .nodes.curl.locked.narHash flake.lock)"

[[ "$NAR_HASH" == "$EXPECTED_NAR_HASH" ]] || echo FAIL
