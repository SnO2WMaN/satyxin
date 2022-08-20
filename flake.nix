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
    pkg-satysfi-algorithm.url = "github:pickoba/satysfi-algorithm";
    pkg-satysfi-azmath.flake = false;
    pkg-satysfi-azmath.url = "github:monaqa/satysfi-azmath";
    pkg-satysfi-base.flake = false;
    pkg-satysfi-base.url = "github:nyuichi/satysfi-base";
    pkg-satysfi-bibyfi.flake = false;
    pkg-satysfi-bibyfi.url = "github:namachan10777/BiByFi";
    pkg-satysfi-chemfml.flake = false;
    pkg-satysfi-chemfml.url = "github:gw31415/satysfi-chemfml";
    pkg-satysfi-class-jlreq.flake = false;
    pkg-satysfi-class-jlreq.url = "github:abenori/satysfi-class-jlreq";
    pkg-satysfi-class-slydifi.flake = false;
    pkg-satysfi-class-slydifi.url = "github:monaqa/slydifi";
    pkg-satysfi-class-stjarticle.flake = false;
    pkg-satysfi-class-stjarticle.url = "github:puripuri2100/stjarticle";
    pkg-satysfi-code-printer.flake = false;
    pkg-satysfi-code-printer.url = "github:puripuri2100/satysfi-code-printer";
    pkg-satysfi-derive.flake = false;
    pkg-satysfi-derive.url = "github:yabaitechtokyo/satysfi-derive";
    pkg-satysfi-easytable.flake = false;
    pkg-satysfi-easytable.url = "github:monaqa/satysfi-easytable";
    pkg-satysfi-enumitem.flake = false;
    pkg-satysfi-enumitem.url = "github:monaqa/satysfi-enumitem";
    pkg-satysfi-figbox.flake = false;
    pkg-satysfi-figbox.url = "github:monaqa/satysfi-figbox";
    pkg-satysfi-fonts-junicode.flake = false;
    pkg-satysfi-fonts-junicode.url = "github:na4zagin3/SATySFi-fonts-junicode";
    pkg-satysfi-fss.flake = false;
    pkg-satysfi-fss.url = "github:na4zagin3/satysfi-fss";
    pkg-satysfi-karnaugh.flake = false;
    pkg-satysfi-karnaugh.url = "github:takagiy/satysfi-karnaugh";
    pkg-satysfi-pagenumber.flake = false;
    pkg-satysfi-pagenumber.url = "github:abenori/satysfi-pagenumber";
    pkg-satysfi-pagestyle.flake = false;
    pkg-satysfi-pagestyle.url = "github:abenori/satysfi-pagestyle";
    pkg-satysfi-railway.flake = false;
    pkg-satysfi-railway.url = "github:monaqa/satysfi-railway";
    pkg-satysfi-ruby.flake = false;
    pkg-satysfi-ruby.url = "github:puripuri2100/SATySFi-ruby";
    pkg-satysfi-sno2wman.url = "github:sno2wman/satysfi-sno2wman";
    pkg-satysfi-uline.flake = false;
    pkg-satysfi-uline.url = "github:puripuri2100/SATySFi-uline";
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
      overlays.default = import ./overlay.nix {
        inherit (pkg-satysfi-sno2wman.satyxinPackages) sno2wman;
      };
      overlay = self.overlays.default;
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            devshell.overlay
            self.overlay
          ];
        };
      in {
        packages = flake-utils.lib.flattenTree (
          rec {
            satysfiDist = pkgs.satyxin.buildSatysfiDist {
              packages = [
                "uline"
                "bibyfi"
                "fss"
                "derive"
                "algorithm"
                "chemfml"
                "ruby"
                "class-slydifi"
                "easytable"
                "sno2wman"
              ];
            };
            example-basic = pkgs.satyxin.buildDocument {
              satysfiDist = self.packages.${system}.satysfiDist;
              satysfiLocal = ./.satysfi/local;

              name = "example-basic";
              src = ./example/basic;
              entrypoint = "main.saty";
              output = "basic.pdf";
            };
            example-slide = pkgs.satyxin.buildDocument {
              satysfiDist = self.packages.${system}.satysfiDist;
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
