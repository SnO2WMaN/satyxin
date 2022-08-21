generator: {pkgs, ...}: let
  g = generator {
    inherit pkgs;
  };
in
  pkgs.satyxin.buildPackage rec {
    inherit (g) name version;

    outdir = name;
    deps = g.deps or [];
    sources = g.sources or {};
  }
