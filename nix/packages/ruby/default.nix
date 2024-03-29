{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
pkgs.callPackage ../../build-package {}
rec {
  pname = "satyxin-ruby";
  version = "0.1.2";

  outdir = "ruby";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "puripuri2100";
      repo = "SATySFi-ruby";
      rev = "v${version}";
      sha256 = "sha256-GEOXhem78zZqtjx4I1iXNtiA+wy6AgU6Y1rJZZ3hLEA=";
    };
  in [
    "${root}/ruby.satyh"
  ];
}
