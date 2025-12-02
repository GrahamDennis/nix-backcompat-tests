#!/bin/bash

EXPECTED_STORE_PATH="/nix/store/qhqilb54ld5g3j0dajqs2yjscsvyk1hb-usesPath"
EVALUATED_STORE_PATH="$(nix eval --raw .#usesPath)"

[[ "$EVALUATED_STORE_PATH" == "$EXPECTED_STORE_PATH" ]] || echo "Nix store path mismatch: got $EVALUATED_STORE_PATH expected $EXPECTED_STORE_PATH"
