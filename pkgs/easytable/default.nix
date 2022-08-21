(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "easytable";
    version = "1.1.2";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "monaqa";
        repo = "satysfi-easytable";
        rev = "v${version}";
        sha256 = "sha256-my6WLJrXeHSDfWrP4STAnr279kHNfLeKv5KIvbLc/s8=";
      };
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
    ];
  }
)
