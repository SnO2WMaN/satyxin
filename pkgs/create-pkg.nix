generator: {
  pkgs,
  inputs,
  ...
}: let
  g = generator {
    inherit pkgs;
    inherit inputs;
  };
in
  pkgs.satyxin.buildPackage rec {
    inherit (g) name version src;

    outdir = name;
    deps = g.deps or [];
    sources = g.sources or {};
  }
