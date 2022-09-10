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
  src = fetchFromGitHub {
    owner = "nyuichi";
    repo = "satysfi-base";
    rev = version;
    sha256 = "sha256-KE75gamAeB+HVbA29eUv88FQQLglHDLWTT65E/EFgVo=";
  };

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
