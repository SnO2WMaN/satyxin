{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-railway";
  version = "0.1.0";

  outdir = "railway";
  sources = let
    root = fetchFromGitHub {
      owner = "monaqa";
      repo = "satysfi-railway";
      rev = "v${version}";
      sha256 = "sha256-DeMNMWeOLTUFXidi7sfDl5gsAdi+vBE5zJmTshjfieI=";
    };
  in [
    "${root}/src"
  ];
  deps = with satyxinPackages; [
    base
    dist
  ];
}
