(import ../create-pkg.nix) (
  {
    pkgs,
    fetchFromGitHub,
    satyxinPackages,
    ...
  }: rec {
    name = "pagestyle";
    version = "1.0.0";
    sources = let
      root = fetchFromGitHub {
        owner = "abenori";
        repo = "satysfi-pagestyle";
        rev = version;
        sha256 = "sha256-tXtTyDlwtLHNjCthGapYwXlttXT37JwvUHf8Snibrac=";
      };
    in [
      "${root}/src"
    ];
    deps = with satyxinPackages; [
      base
      dist
      fss
      pagenumber
    ];
  }
)
