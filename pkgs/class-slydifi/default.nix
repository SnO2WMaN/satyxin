(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "class-slydifi";
    version = "0.5.0";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "monaqa";
        repo = "slydifi";
        rev = "v${version}";
        sha256 = "sha256-O/tEsr5H3llh4fETamzYxk63rwU82OUecxKS5rtw8Pg=";
      };
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      enumitem
      figbox
      base
      railway
    ];
  }
)
