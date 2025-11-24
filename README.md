# Tests for verifying that a nix version is backwards-compatible with nix 2.18.9

To run with the `nix` in your PATH:

```
for i in *; do pushd $i; ./test.sh; popd; done
```

To run with a new `nix` package, e.g. `/nix/store/vxfwha6c09lay6xzq1yqjhd4gkc1kfa9-nix-2.18.9`

```
for i in *; do pushd $i; env PATH=/nix/store/vxfwha6c09lay6xzq1yqjhd4gkc1kfa9-nix-2.18.9/bin:$PATH ./test.sh; popd; done
```

