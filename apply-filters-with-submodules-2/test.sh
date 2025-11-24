#!/bin/bash

set -euo pipefail

EXPECTED_OUT_PATH=/nix/store/lqcvl4xvpjwpr41kinhsc1azj4y26034-source
EVAL_OUT_PATH=$(nix eval --raw .#example-submodules.outPath)

[[ "$EVAL_OUT_PATH" == "$EXPECTED_OUT_PATH" ]] || echo "outPath mismatch: got $EVAL_OUT_PATH expected $EXPECTED_OUT_PATH"

nix flake lock --update-input example-submodules

EXPECTED_NAR_HASH="sha256-KsAx5rAo70Rewf3DhDaZSoqT/K/98V8pT1/151G2FEE="
NAR_HASH="$(jq -r '.nodes."example-submodules".locked.narHash' flake.lock)"

[[ "$NAR_HASH" == "$EXPECTED_NAR_HASH" ]] || echo "NAR hash mismatch: got $NAR_HASH expected $EXPECTED_NAR_HASH"
