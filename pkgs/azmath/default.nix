(import ../create-pkg.nix)
(
  {pkgs, ...}: rec {
    name = "azmath";
    version = "0.0.3";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "monaqa";
        repo = "satysfi-azmath";
        rev = "v${version}";
        sha256 = "sha256-RUgwrCLEBYPOQrKLaAWACSTePnauHZRgikDjHs5TR+o=";
      };
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [base];
  }
)
