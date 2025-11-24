#!/bin/bash

set -euo pipefail

rm -rf ~/.cache/nix

EXPECTED_OUT_PATH=/nix/store/mr2dmlqa4sjhn51gbg92zbid7732jjmd-source
EVAL_OUT_PATH=$(nix eval --raw .#example-submodules.outPath)

[[ "$EVAL_OUT_PATH" == "$EXPECTED_OUT_PATH" ]] || echo "outPath mismatch: got $EVAL_OUT_PATH expected $EXPECTED_OUT_PATH"

rm -rf ~/.cache/nix

nix flake lock --update-input example-submodules

EXPECTED_NAR_HASH="sha256-J1BfVBRPqd8R8WgAebQ7sBj6gKwsbeEvwiTV7zcCazk="
NAR_HASH="$(jq -r '.nodes."example-submodules".locked.narHash' flake.lock)"

[[ "$NAR_HASH" == "$EXPECTED_NAR_HASH" ]] || echo "NAR hash mismatch: got $NAR_HASH expected $EXPECTED_NAR_HASH"
