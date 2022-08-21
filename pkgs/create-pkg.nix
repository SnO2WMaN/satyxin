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
    inherit (g) name version;

    outdir = name;
    deps = g.deps or [];
    sources = g.sources or {};

    src = with (builtins.fromJSON (builtins.readFile ../flake.lock)).nodes."pkg-satysfi-${g.name}".locked;
      pkgs.fetchFromGitHub {
        inherit owner repo rev;
        sha256 = narHash;
      };
  }
