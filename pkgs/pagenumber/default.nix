{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-pagenumber";
  version = "1.0.0";

  outdir = "pagenumber";
  src = fetchFromGitHub {
    owner = "abenori";
    repo = "satysfi-pagenumber";
    rev = version;
    sha256 = "sha256-6dUsx9dfxhpPF1NVcafenoi81uH7oacODeBeHIyfz5A=";
  };

  sources = let
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
