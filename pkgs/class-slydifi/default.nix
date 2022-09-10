{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-class-slydifi";
  version = "0.5.0";

  outdir = "class-slydifi";
  sources = let
    root = fetchFromGitHub {
      owner = "monaqa";
      repo = "slydifi";
      rev = "v${version}";
      sha256 = "sha256-O/tEsr5H3llh4fETamzYxk63rwU82OUecxKS5rtw8Pg=";
    };
  in [
    "${root}/src"
  ];
  deps = with satyxinPackages; [
    enumitem
    figbox
    base
    railway
  ];
}
