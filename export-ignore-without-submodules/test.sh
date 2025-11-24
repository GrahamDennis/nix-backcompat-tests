#!/bin/bash

set -euo pipefail

rm -rf ~/.cache/nix

EXPECTED_OUT_PATH=/nix/store/ykqz8vc311xgfvww23xdd18l6ffzpp2k-source
EVAL_OUT_PATH=$(nix eval --raw .#babeld.outPath)

[[ "$EVAL_OUT_PATH" == "$EXPECTED_OUT_PATH" ]] || echo "outPath mismatch: got $EVAL_OUT_PATH expected $EXPECTED_OUT_PATH"

rm -rf ~/.cache/nix

nix flake lock --update-input babeld

EXPECTED_NAR_HASH="sha256-O44+xtDb2tQC3fWAf8DCoGpCzuEua9watccodNPZHVg="
NAR_HASH="$(jq -r .nodes.babeld.locked.narHash flake.lock)"

[[ "$NAR_HASH" == "$EXPECTED_NAR_HASH" ]] || echo "NAR hash mismatch: got $NAR_HASH expected $EXPECTED_NAR_HASH"
