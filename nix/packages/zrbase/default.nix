{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
pkgs.callPackage ../../build-package {}
rec {
  pname = "satyxin-zrbase";
  version = "0.4.0";

  outdir = "zrbase";

  copyfrom = let
    root = fetchFromGitHub {
      owner = "zr-tex8r";
      repo = "satysfi-zrbase";
      rev = version;
      sha256 = "sha256-waqV3IJEeFOoex0vqI8zPogc/t3nDF7gQalm3Gfu0cA=";
    };
  in [
    "${root}/zexn0.satyg"
    "${root}/zfmt0.satyg"
    "${root}/zl0.satyg"
    "${root}/zlist0.satyg"
    "${root}/zlog0.satyg"
    "${root}/zmtdoc0.satyh"
    "${root}/znum0.satyg"
    "${root}/zp0.satyg"
    "${root}/zrandom0.satyg"
    "${root}/zrbase0.satyg"
    "${root}/zresult0.satyg"
    "${root}/zs0.satyg"
  ];
}
