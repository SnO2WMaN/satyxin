(import ../create-pkg.nix) (
  {
    pkgs,
    fetchFromGitHub,
    satyxinPackages,
    ...
  }: rec {
    name = "easytable";
    version = "1.1.2";
    sources = let
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
)
