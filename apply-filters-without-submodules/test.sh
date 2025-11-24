#!/bin/bash

set -euo pipefail

rm -rf ~/.cache/nix

EXPECTED_OUT_PATH=/nix/store/5rkdanj45rgd2r4lzxfp6wgywf64x442-source
EVAL_OUT_PATH=$(nix eval --raw .#curl.outPath)

[[ "$EVAL_OUT_PATH" == "$EXPECTED_OUT_PATH" ]] || echo "outPath mismatch: got $EVAL_OUT_PATH expected $EXPECTED_OUT_PATH"

rm -rf ~/.cache/nix

nix flake lock --update-input curl

EXPECTED_NAR_HASH="sha256-NGVF5fEb/vK8VnLIrP80P/cOYbURf/nS3VVrZA9AXGo="
NAR_HASH="$(jq -r .nodes.curl.locked.narHash flake.lock)"

[[ "$NAR_HASH" == "$EXPECTED_NAR_HASH" ]] || echo "NAR hash mismatch: got $NAR_HASH expected $EXPECTED_NAR_HASH"
