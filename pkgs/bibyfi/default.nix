{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-bibyfi";
  version = "0.0.2";

  outdir = "bibyfi";
  src = fetchFromGitHub {
    owner = "namachan10777";
    repo = "BiByFi";
    rev = "v${version}";
    sha256 = "sha256-ppX4i5924F/DTlSQmloXdGOeCaDMJJKq3M/NE2khVvA=";
  };

  sources = let
    root = fetchFromGitHub {
      owner = "namachan10777";
      repo = "BiByFi";
      rev = "v${version}";
      sha256 = "sha256-ppX4i5924F/DTlSQmloXdGOeCaDMJJKq3M/NE2khVvA=";
    };
  in [
    "${root}/bibyfi.satyh"
    "${root}/bibyfi-IEEETran.satyh"
  ];
}
