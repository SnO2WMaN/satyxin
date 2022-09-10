{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-uline";
  version = "0.2.2";

  outdir = "uline";
  sources = let
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
