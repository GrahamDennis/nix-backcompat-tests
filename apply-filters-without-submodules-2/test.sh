#!/bin/bash

set -euo pipefail

nix flake lock --update-input example-submodules

EXPECTED_NAR_HASH="sha256-J1BfVBRPqd8R8WgAebQ7sBj6gKwsbeEvwiTV7zcCazk="
NAR_HASH="$(jq -r .nodes.example-submodules.locked.narHash flake.lock)"

[[ "$NAR_HASH" == "$EXPECTED_NAR_HASH" ]] || echo FAIL
