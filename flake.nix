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

    satysfi-azmath.flake = false;
    satysfi-azmath.url = "github:monaqa/satysfi-azmath";
    satysfi-base.flake = false;
    satysfi-base.url = "github:nyuichi/satysfi-base";
    satysfi-bibyfi.flake = false;
    satysfi-bibyfi.url = "github:namachan10777/BiByFi";
    satysfi-easytable.flake = false;
    satysfi-easytable.url = "github:monaqa/satysfi-easytable";
    satysfi-fonts-junicode.flake = false;
    satysfi-fonts-junicode.url = "github:na4zagin3/SATySFi-fonts-junicode";
    satysfi-fss.flake = false;
    satysfi-fss.url = "github:na4zagin3/satysfi-fss";
    satysfi-uline.flake = false;
    satysfi-uline.url = "github:puripuri2100/SATySFi-uline";
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
