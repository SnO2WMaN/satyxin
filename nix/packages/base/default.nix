{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
pkgs.callPackage ../../build-package {}
rec {
  pname = "satyxin-base";
  version = "1.4.0";

  outdir = "base";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "nyuichi";
      repo = "satysfi-base";
      rev = version;
      sha256 = "sha256-KE75gamAeB+HVbA29eUv88FQQLglHDLWTT65E/EFgVo=";
    };
  in [
    "${root}/src"
  ];

  deps = with satyxinPackages; [
    zrbase
  ];
}
