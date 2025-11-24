#!/bin/bash

rm -rf ~/.cache/nix

nix flake lock --update-input nix-backcompat-tests

EXPECTED_ORIGINAL_URL="ssh://git@github.com/GrahamDennis/nix-backcompat-tests?dir=trivial-subflake"
ORIGINAL_URL="$(jq -r '.nodes."nix-backcompat-tests".original.url' flake.lock)"

[[ "$ORIGINAL_URL" == "$EXPECTED_ORIGINAL_URL" ]] || echo "Original URL mismatch: got $ORIGINAL_URL expected $EXPECTED_ORIGINAL_URL"
