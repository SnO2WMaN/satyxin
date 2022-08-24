generator: {
  pkgs,
  satyxin,
  ...
} @ input: let
  g = pkgs.callPackage generator {};
in
  satyxin.buildPackage rec {
    inherit (g) name version;

    outdir = name;
    deps = g.deps or [];
    sources = g.sources or {};
  }
