(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "pagenumber";
    version = "1.0.0";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "abenori";
        repo = "satysfi-pagenumber";
        rev = version;
        sha256 = "sha256-6dUsx9dfxhpPF1NVcafenoi81uH7oacODeBeHIyfz5A=";
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
