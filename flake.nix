{
  description = "Build SATySFi documents using Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    uline = {
      url = "github:puripuri2100/SATySFi-uline";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, uline }:
    rec {
      overlays.default = (import ./overlay.nix);
      overlay = overlays.default;
    } //
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (import ./overlay.nix)
          ];
        };
        in
        rec {
          packages = {
            uline = pkgs.satyxin.buildPackage {
              name = "satysfi-uline";
              src = uline;
              path = "uline.satyh";
            };
            demo = pkgs.satyxin.buildDocument {
              name = "satyxin-demo";
              src = ./example;
              filename = "demo.saty";
              buildInputs = [ packages.uline ];
            };
          };

          defaultPackage = packages.demo;
        }
      );
}
