#!/bin/bash

set -euo pipefail

nix flake lock --update-input example-submodules

EXPECTED_NAR_HASH="sha256-KsAx5rAo70Rewf3DhDaZSoqT/K/98V8pT1/151G2FEE="
NAR_HASH="$(jq -r .nodes.example-submodules.locked.narHash flake.lock)"

[[ "$NAR_HASH" == "$EXPECTED_NAR_HASH" ]] || echo FAIL
