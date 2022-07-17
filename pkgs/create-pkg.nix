let
  lock = builtins.fromJSON (builtins.readFile ../flake.lock);
in
  generator: {
    pkgs,
    satyxinPkgs,
  }: let
    g = generator {inherit satyxinPkgs;};
  in
    (import ../nix/build-package) {inherit pkgs;} rec {
      inherit (g) name;
      sources = g.sources or {};
      deps = g.deps or [];

      src = with lock.nodes."pkg-satysfi-${name}".locked;
        pkgs.fetchFromGitHub {
          inherit owner repo rev;
          sha256 = narHash;
        };
    }
