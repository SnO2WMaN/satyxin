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

    pkg-satysfi-algorithm.flake = false;
    pkg-satysfi-algorithm.url = "github:pickoba/satysfi-algorithm/1.0.0";
    pkg-satysfi-azmath.flake = false;
    pkg-satysfi-azmath.url = "github:monaqa/satysfi-azmath/v0.0.3";
    pkg-satysfi-base.flake = false;
    pkg-satysfi-base.url = "github:nyuichi/satysfi-base/1.4.0";
    pkg-satysfi-bibyfi.flake = false;
    pkg-satysfi-bibyfi.url = "github:namachan10777/BiByFi/v0.0.2";
    pkg-satysfi-chemfml.flake = false;
    pkg-satysfi-chemfml.url = "github:gw31415/satysfi-chemfml/v1.0.1";
    pkg-satysfi-class-jlreq.flake = false;
    pkg-satysfi-class-jlreq.url = "github:abenori/satysfi-class-jlreq/0.0.3";
    pkg-satysfi-class-slydifi.flake = false;
    pkg-satysfi-class-slydifi.url = "github:monaqa/slydifi/v0.5.0";
    pkg-satysfi-class-stjarticle.flake = false;
    pkg-satysfi-class-stjarticle.url = "github:puripuri2100/stjarticle/9381bee930818464e76cdc4622eb381a1aba164f"; # untagged
    pkg-satysfi-code-printer.flake = false;
    pkg-satysfi-code-printer.url = "github:puripuri2100/satysfi-code-printer/1.1.1";
    pkg-satysfi-derive.flake = false;
    pkg-satysfi-derive.url = "github:yabaitechtokyo/satysfi-derive/1.0.0";
    pkg-satysfi-easytable.flake = false;
    pkg-satysfi-easytable.url = "github:monaqa/satysfi-easytable/v1.1.2";
    pkg-satysfi-enumitem.flake = false;
    pkg-satysfi-enumitem.url = "github:monaqa/satysfi-enumitem/v3.0.1";
    pkg-satysfi-figbox.flake = false;
    pkg-satysfi-figbox.url = "github:monaqa/satysfi-figbox/v0.1.4";
    pkg-satysfi-fonts-junicode.flake = false;
    pkg-satysfi-fonts-junicode.url = "github:na4zagin3/SATySFi-fonts-junicode/331911ba9102d7cc489549a576a60e33affacc76"; # can't use v1.0002+satysfi0.0.5 because contains `+`
    pkg-satysfi-fss.flake = false;
    pkg-satysfi-fss.url = "github:na4zagin3/satysfi-fss/v0.2.0";
    pkg-satysfi-karnaugh.flake = false;
    pkg-satysfi-karnaugh.url = "github:takagiy/satysfi-karnaugh/ed38a3ec2afa09a383a2b4e9068ece4dd9bba715"; # untagged
    pkg-satysfi-pagenumber.flake = false;
    pkg-satysfi-pagenumber.url = "github:abenori/satysfi-pagenumber/1.0.0";
    pkg-satysfi-pagestyle.flake = false;
    pkg-satysfi-pagestyle.url = "github:abenori/satysfi-pagestyle/1.0.0";
    pkg-satysfi-railway.flake = false;
    pkg-satysfi-railway.url = "github:monaqa/satysfi-railway/v0.1.0";
    pkg-satysfi-ruby.flake = false;
    pkg-satysfi-ruby.url = "github:puripuri2100/SATySFi-ruby/0.1.2";
    pkg-satysfi-sno2wman.url = "github:sno2wman/satysfi-sno2wman/v1.0.0";
    pkg-satysfi-uline.flake = false;
    pkg-satysfi-uline.url = "github:puripuri2100/SATySFi-uline/0.2.2";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    devshell,
    pkg-satysfi-sno2wman,
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
            # satyxin package overlays
            self.overlays.default
            pkg-satysfi-sno2wman.overlays.default
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
                sno2wman
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
