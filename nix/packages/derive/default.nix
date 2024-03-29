{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
pkgs.callPackage ../../build-package {}
rec {
  pname = "satyxin-derive";
  version = "1.0.0";

  outdir = "derive";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "yabaitechtokyo";
      repo = "satysfi-derive";
      rev = version;
      sha256 = "sha256-E2Is9WDO/psnWEL1Nt43QkkSPZOL3uT0Xm54y1jZgfM=";
    };
  in [
    "${root}/src"
  ];
  deps = with satyxinPackages; [
    base
  ];
}
