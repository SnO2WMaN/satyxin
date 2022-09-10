{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-chemfml";
  version = "1.0.1";

  outdir = "chemfml";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "gw31415";
      repo = "satysfi-chemfml";
      rev = "v${version}";
      sha256 = "sha256-HfWHyic7GGS6bua3G388Swmh6vnc74r4zfH8ps9B51M=";
    };
  in [
    "${root}/src"
  ];

  deps = with satyxinPackages; [
    base
    dist
  ];
}
