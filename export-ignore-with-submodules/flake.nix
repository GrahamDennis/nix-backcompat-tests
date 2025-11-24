{
  inputs = {
    babeld.url = "git+ssh://git@github.com/jech/babeld?submodules=1&rev=950992f282d6139ce543f225564a35ac564ca1c2";
    babeld.flake = false;
  };

  outputs = inputs: inputs;
}