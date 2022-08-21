(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "chemfml";
    version = "1.0.1";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "gw31415";
        repo = "satysfi-chemfml";
        rev = "v${version}";
        sha256 = "sha256-HfWHyic7GGS6bua3G388Swmh6vnc74r4zfH8ps9B51M=";
      };
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      dist
    ];
  }
)
