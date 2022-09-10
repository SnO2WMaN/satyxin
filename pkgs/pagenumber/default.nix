{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
pkgs.callPackage ../../nix/build-package {}
rec {
  pname = "satyxin-pagenumber";
  version = "1.0.0";

  outdir = "pagenumber";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "abenori";
      repo = "satysfi-pagenumber";
      rev = version;
      sha256 = "sha256-6dUsx9dfxhpPF1NVcafenoi81uH7oacODeBeHIyfz5A=";
    };
  in [
    "${root}/src"
  ];
  deps = with satyxinPackages; [
    base
    dist
  ];
}
