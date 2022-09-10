{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
pkgs.callPackage ../../nix/build-package {}
rec {
  pname = "satyxin-pagestyle";
  version = "1.0.0";

  outdir = "pagestyle";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "abenori";
      repo = "satysfi-pagestyle";
      rev = version;
      sha256 = "sha256-tXtTyDlwtLHNjCthGapYwXlttXT37JwvUHf8Snibrac=";
    };
  in [
    "${root}/src"
  ];
  deps = with satyxinPackages; [
    base
    dist
    fss
    pagenumber
  ];
}
