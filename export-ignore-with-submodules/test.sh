#!/bin/bash

set -euo pipefail

rm -rf ~/.cache/nix

EXPECTED_OUT_PATH=/nix/store/95dmx8z9p79m7q4lzb0cypgh0x8cbmx9-source
EVAL_OUT_PATH=$(nix eval --raw .#babeld.outPath)

[[ "$EVAL_OUT_PATH" == "$EXPECTED_OUT_PATH" ]] || echo "outPath mismatch: got $EVAL_OUT_PATH expected $EXPECTED_OUT_PATH"

rm -rf ~/.cache/nix

nix flake lock --update-input babeld

EXPECTED_NAR_HASH="sha256-AvCUtp99eucPK0/ZW0fLxPvYwVlnYdQTgvxMGTVmw88="
NAR_HASH="$(jq -r .nodes.babeld.locked.narHash flake.lock)"

[[ "$NAR_HASH" == "$EXPECTED_NAR_HASH" ]] || echo "NAR hash mismatch: got $NAR_HASH expected $EXPECTED_NAR_HASH"
