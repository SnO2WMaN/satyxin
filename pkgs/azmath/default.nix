(import ../create-pkg.nix)
(
  {
    pkgs,
    fetchFromGitHub,
    satyxinPackages,
    ...
  }: rec {
    name = "azmath";
    version = "0.0.3";
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
)
