{
  inputs = {
    without-submodules.url = "git+ssh://git@github.com/GrahamDennis/example-without-submodules?ref=main&rev=83db26bcc048e785c6816541bb7e94f6c633d7e8";
    without-submodules.flake = false;
  };

  outputs = inputs: inputs;
}