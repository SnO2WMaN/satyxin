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
  (import ../nix/build-package) {inherit pkgs;} {
    inherit (g) name version;
    sources = g.sources or {};
    deps = g.deps or [];
    outdir = g.name;

    src = with (builtins.fromJSON (builtins.readFile ../flake.lock)).nodes."pkg-satysfi-${g.name}".locked;
      pkgs.fetchFromGitHub {
        inherit owner repo rev;
        sha256 = narHash;
      };
  }
