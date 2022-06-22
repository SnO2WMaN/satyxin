{
  description = "Packages for satyxin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    devshell.url = "github:numtide/devshell";
    flake-utils.url = "github:numtide/flake-utils";
    satyxin.url = "github:SnO2WMaN/satyxin";

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    satysfi-uline = {
      url = "github:puripuri2100/SATySFi-uline";
      flake = false;
    };
    satysfi-fss = {
      url = "github:na4zagin3/satysfi-fss";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    devshell,
    satyxin,
    ...
  }:
    rec {
      overlays.default = final: prev: (
        satyxin.overlay final prev // (import ./overlay.nix) final prev
      );
      overlay = overlays.default;
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            devshell.overlay
            satyxin.overlay
          ];
        };
      in {
        devShell = pkgs.devshell.mkShell {
          imports = [
            (pkgs.devshell.importTOML ./devshell.toml)
          ];
        };
      }
    );
}
