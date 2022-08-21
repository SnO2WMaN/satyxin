(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "algorithm";
    version = "1.0.0";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "pickoba";
        repo = "satysfi-algorithm";
        rev = version;
        sha256 = "sha256-q6am7go4fNLfQVnupX0wav1esZGq0UG/UG/j5J6UfCQ=";
      };
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      dist
      base
      fss
    ];
  }
)
