{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
pkgs.callPackage ../../nix/build-package {}
rec {
  pname = "satyxin-uline";
  version = "0.2.2";

  outdir = "uline";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "puripuri2100";
      repo = "SATySFi-uline";
      rev = "v${version}";
      sha256 = "sha256-94lChvMIkuIFHJgPoMbQCkivIGwz5EieCOKpcTaKThc=";
    };
  in [
    "${root}/uline.satyh"
  ];
}
