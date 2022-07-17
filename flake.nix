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

    satysfi-formatter.url = "github:usagrada/satysfi-formatter";
    satysfi-formatter.flake = false;
    satysfi-language-server.url = "github:monaqa/satysfi-language-server";
    satysfi-language-server.flake = false;

    satysfi-algorithm.flake = false;
    satysfi-algorithm.url = "github:pickoba/satysfi-algorithm";
    satysfi-azmath.flake = false;
    satysfi-azmath.url = "github:monaqa/satysfi-azmath";
    satysfi-base.flake = false;
    satysfi-base.url = "github:nyuichi/satysfi-base";
    satysfi-bibyfi.flake = false;
    satysfi-bibyfi.url = "github:namachan10777/BiByFi";
    satysfi-chemfml.flake = false;
    satysfi-chemfml.url = "github:gw31415/satysfi-chemfml";
    satysfi-class-jlreq.flake = false;
    satysfi-class-jlreq.url = "github:abenori/satysfi-class-jlreq";
    satysfi-class-slydifi.flake = false;
    satysfi-class-slydifi.url = "github:monaqa/slydifi";
    satysfi-code-printer.flake = false;
    satysfi-code-printer.url = "github:puripuri2100/satysfi-code-printer";
    satysfi-derive.flake = false;
    satysfi-derive.url = "github:yabaitechtokyo/satysfi-derive";
    satysfi-easytable.flake = false;
    satysfi-easytable.url = "github:monaqa/satysfi-easytable";
    satysfi-enumitem.flake = false;
    satysfi-enumitem.url = "github:monaqa/satysfi-enumitem";
    satysfi-figbox.flake = false;
    satysfi-figbox.url = "github:monaqa/satysfi-figbox";
    satysfi-fonts-junicode.flake = false;
    satysfi-fonts-junicode.url = "github:na4zagin3/SATySFi-fonts-junicode";
    satysfi-fss.flake = false;
    satysfi-fss.url = "github:na4zagin3/satysfi-fss";
    satysfi-karnaugh.flake = false;
    satysfi-karnaugh.url = "github:takagiy/satysfi-karnaugh";
    satysfi-pagenumber.flake = false;
    satysfi-pagenumber.url = "github:abenori/satysfi-pagenumber";
    satysfi-pagestyle.flake = false;
    satysfi-pagestyle.url = "github:abenori/satysfi-pagestyle";
    satysfi-railway.flake = false;
    satysfi-railway.url = "github:monaqa/satysfi-railway";
    satysfi-ruby.flake = false;
    satysfi-ruby.url = "github:puripuri2100/SATySFi-ruby";
    satysfi-uline.flake = false;
    satysfi-uline.url = "github:puripuri2100/SATySFi-uline";
    satysfi.flake = false;
    satysfi.url = "github:gfngfn/SATySFi";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    devshell,
    ...
  }:
    {
      overlays.default = import ./overlay.nix;
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
            satydist = pkgs.satyxin.buildSatydist {
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
              ];
            };
            "example/basic" = pkgs.satyxin.buildDocument {
              inherit satydist;
              name = "example-basic";
              src = ./example/basic;
              entrypoint = "main.saty";
              output = "basic.pdf";
            };
            "example/slide" = pkgs.satyxin.buildDocument {
              inherit satydist;
              name = "example-slide";
              src = ./example/slide;
              entrypoint = "main.saty";
              output = "slide.pdf";
            };
          }
          // pkgs.satyxin
          // pkgs.satyxinPackages
          // {
            inherit
              (pkgs)
              satysfi-formatter
              satysfi-language-server
              ;
          }
        );
        devShell = pkgs.devshell.mkShell {
          imports = [
            (pkgs.devshell.importTOML ./devshell.toml)
          ];
          packages = [
            (
              pkgs.writers.writeBashBin
              "satysfi-fmt-each"
              ''
                for f in "$@";
                  do satysfi-fmt --write "$f"
                done
              ''
            )
          ];
        };
        checks = self.packages.${system};
      }
    );
}
