{
  description = "Build SATySFi documents using Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    devshell.url = "github:numtide/devshell";
    flake-utils.url = "github:numtide/flake-utils";

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    satysfi.url = "github:gfngfn/SATySFi";
    satysfi.flake = false;

    satysfi-formatter.url = "github:usagrada/satysfi-formatter";
    satysfi-formatter.flake = false;
    satysfi-language-server.url = "github:monaqa/satysfi-language-server";
    satysfi-language-server.flake = false;
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    devshell,
    ...
  } @ inputs:
    {
      overlays.default = import ./nix/make-overlay.nix inputs;
      overlay = self.overlays.default;
    }
    // flake-utils.lib.eachSystem [
      "x86_64-linux"
      "x86_64-darwin"
    ] (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            devshell.overlay
            self.overlays.default
          ];
        };
      in {
        packages = flake-utils.lib.flattenTree (
          rec {
            satysfi-dist = pkgs.satyxin.buildSatysfiDist {
              packages = with pkgs.satyxinPackages; [
                algorithm
                bibyfi
                chemfml
                class-slydifi
                derive
                easytable
                fss
                ruby
                uline
              ];
            };
            example-basic = pkgs.satyxin.buildDocument {
              satysfiDist = self.packages.${system}.satysfi-dist;
              satysfiLocal = ./.satysfi/local;

              name = "example-basic";
              src = ./example/basic;
              entrypoint = "main.saty";
              output = "basic.pdf";
            };
            example-slide = pkgs.satyxin.buildDocument {
              satysfiDist = self.packages.${system}.satysfi-dist;
              name = "example-slide";
              src = ./example/slide;
              entrypoint = "main.saty";
              output = "slide.pdf";
            };
            github-page = pkgs.stdenv.mkDerivation {
              name = "satyxin-sample-page";
              dontBuild = true;
              dontUnpack = true;
              installPhase = with self.packages.${system}; ''
                mkdir $out
                cp -r ${example-basic}/basic.pdf $out/basic.pdf
                cp -r ${example-slide}/slide.pdf $out/slide.pdf
              '';
            };
          }
          // (with pkgs.lib.attrsets;
            mapAttrs' (
              key: value: (nameValuePair ("satyxin-package-" + key) value)
            )
            pkgs.satyxinPackages)
          // {
            inherit
              (pkgs)
              satysfi-formatter
              satysfi-language-server
              satysfi-formatter-each
              ;
          }
        );
        devShell = pkgs.devshell.mkShell {
          imports = [
            (pkgs.devshell.importTOML ./devshell.toml)
          ];
        };
        checks = self.packages.${system};
      }
    );
}
