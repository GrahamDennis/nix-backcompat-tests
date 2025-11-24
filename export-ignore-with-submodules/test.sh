#!/bin/bash

set -euo pipefail

nix flake lock --update-input babeld

EXPECTED_NAR_HASH="sha256-AvCUtp99eucPK0/ZW0fLxPvYwVlnYdQTgvxMGTVmw88="
NAR_HASH="$(jq -r .nodes.babeld.locked.narHash flake.lock)"

[[ "$NAR_HASH" == "$EXPECTED_NAR_HASH" ]] || echo FAIL
