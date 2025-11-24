{
  inputs = {
    example-submodules.url = "git+ssh://git@github.com/GrahamDennis/example-submodules?rev=f36b04115d600cdfd44008b4095baee5ac3173c1";
    example-submodules.flake = false;
  };

  outputs = inputs: inputs;
}