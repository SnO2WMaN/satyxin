(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "railway";
    version = "0.1.0";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "monaqa";
        repo = "satysfi-railway";
        rev = "v${version}";
        sha256 = "sha256-DeMNMWeOLTUFXidi7sfDl5gsAdi+vBE5zJmTshjfieI=";
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
