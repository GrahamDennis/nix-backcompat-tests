{
  inputs = {
    nix-backcompat-tests.url = "git+ssh://git@github.com/GrahamDennis/nix-backcompat-tests?ref=main&dir=trivial-subflake&rev=3adb36c2154b22d4e06ff0a4d68a4c6c77f494cc";
    nix-backcompat-tests.flake = false;
  };

  outputs = inputs: inputs;
}