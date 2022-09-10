{
  pkgs,
  fetchFromGitHub,
  satyxin,
  satyxinPackages,
  ...
}:
satyxin.buildPackage rec {
  pname = "satyxin-azmath";
  version = "0.0.3";

  outdir = "azmath";
  sources = let
    root = fetchFromGitHub {
      owner = "monaqa";
      repo = "satysfi-azmath";
      rev = "v${version}";
      sha256 = "sha256-RUgwrCLEBYPOQrKLaAWACSTePnauHZRgikDjHs5TR+o=";
    };
  in [
    "${root}/src"
  ];

  deps = with satyxinPackages; [base];
}
