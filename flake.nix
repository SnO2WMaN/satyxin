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

    satysfi-base = {
      url = "github:nyuichi/satysfi-base";
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
    satysfi-bibyfi = {
      url = "github:namachan10777/BiByFi";
      flake = false;
    };
    satysfi-fonts-junicode = {
      url = "github:na4zagin3/SATySFi-fonts-junicode";
      flake = false;
    };
    satysfi-easytable = {
      url = "github:monaqa/satysfi-easytable";
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
    {
      overlays.default = final: prev: (
        satyxin.overlay final prev // (import ./overlay.nix) final prev
      );
      overlay = self.overlays.default;
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            devshell.overlay
            satyxin.overlay
            self.overlay
          ];
        };
      in {
        packages = pkgs.satyxinPackages;
        devShell = pkgs.devshell.mkShell {
          imports = [
            (pkgs.devshell.importTOML ./devshell.toml)
          ];
        };
        checks = self.packages.${system};
      }
    );
}
