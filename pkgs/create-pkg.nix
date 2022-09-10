generator: {
  pkgs,
  satyxin,
  ...
} @ input: let
  g = pkgs.callPackage generator {};
in
  satyxin.buildPackage rec {
    inherit (g) version;

    pname = g.name;
    outdir = pname;
    deps = g.deps or [];
    sources = g.sources or {};
  }
