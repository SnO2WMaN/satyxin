{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-easytable";
  version = "1.1.2";

  outdir = "easytable";
  copyfrom = let
    root = fetchFromGitHub {
      owner = "monaqa";
      repo = "satysfi-easytable";
      rev = "v${version}";
      sha256 = "sha256-my6WLJrXeHSDfWrP4STAnr279kHNfLeKv5KIvbLc/s8=";
    };
  in [
    "${root}/src"
  ];
  deps = with satyxinPackages; [
    base
  ];
}
