(import ../create-pkg.nix) (
  {
    pkgs,
    fetchFromGitHub,
    satyxinPackages,
    ...
  }: rec {
    name = "pagenumber";
    version = "1.0.0";
    sources = let
      root = fetchFromGitHub {
        owner = "abenori";
        repo = "satysfi-pagenumber";
        rev = version;
        sha256 = "sha256-6dUsx9dfxhpPF1NVcafenoi81uH7oacODeBeHIyfz5A=";
      };
    in [
      "${root}/src"
    ];
    deps = with satyxinPackages; [
      base
      dist
    ];
  }
)
