(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "fss";
    version = "0.2.0";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "na4zagin3";
        repo = "satysfi-fss";
        rev = "v${version}";
        sha256 = "sha256-9MLw4A5pF5f3KY5r7v+bDV9BAaPzKRh1Yi+dQi5QMPs=";
      };
    in [
      "${root}/src/fss"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      dist
      fonts-junicode
    ];
  }
)
