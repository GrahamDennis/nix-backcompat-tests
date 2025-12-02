{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: 
    flake-utils.lib.eachDefaultSystem (system: let pkgs = nixpkgs.legacyPackages.${system}; in rec {
      packages.withSymlink = pkgs.runCommand "withSymlink" {} ''
        mkdir $out
        echo "Hello World" > $out/file.txt
        ln -s $out/file.txt $out/link.txt
      '';

      packages.usesPath = builtins.path {
        path = "${packages.withSymlink}/";
        name = "usesPath";
      };
    });
}