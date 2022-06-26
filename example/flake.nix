{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    satyxin.url = "github:SnO2WMaN/satyxin";
    satyxinur.url = "github:SnO2WMaN/satyxinur";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    satyxin,
    satyxinur,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            satyxin.overlay
            satyxinur.overlay
          ];
        };
      in {
        packages = flake-utils.lib.flattenTree {
          demo = pkgs.satyxin.buildDocument {
            name = "satyxin-demo";
            src = ./.;
            filename = "demo.saty";
            buildInputs = with pkgs.satyxinPackages; [
              satysfi-uline
            ];
          };
        };
        defaultPackage = packages.demo;
      }
    );
}
