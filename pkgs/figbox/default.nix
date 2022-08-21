(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "figbox";
    version = "0.1.4";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "monaqa";
        repo = "satysfi-figbox";
        rev = "v${version}";
        sha256 = "sha256-2S0Mwh90QqxcMI/iG28VPS3xW39zJmibDQ3QeeDGUvc=";
      };
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      dist
    ];
  }
)
