{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-algorithm";
  version = "1.0.0";

  outdir = "algorithm";
  sources = let
    root = fetchFromGitHub {
      owner = "pickoba";
      repo = "satysfi-algorithm";
      rev = version;
      sha256 = "sha256-q6am7go4fNLfQVnupX0wav1esZGq0UG/UG/j5J6UfCQ=";
    };
  in [
    "${root}/src"
  ];

  deps = with satyxinPackages; [
    dist
    base
    fss
  ];
}
