{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-karnaugh";
  version = "ed38a3ec2afa09a383a2b4e9068ece4dd9bba715";

  outdir = "karnaugh";
  sources = let
    root = fetchFromGitHub {
      owner = "takagiy";
      repo = "satysfi-karnaugh";
      rev = version;
      sha256 = "sha256-guVblr9eu0HgQo8zUth3tPVrIDyu4yF2CgzhUnXsop0=";
    };
  in [
    "${root}/karnaugh.satyh"
  ];
}
