(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "ruby";
    version = "0.1.2";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "puripuri2100";
        repo = "SATySFi-ruby";
        rev = "v${version}";
        sha256 = "sha256-GEOXhem78zZqtjx4I1iXNtiA+wy6AgU6Y1rJZZ3hLEA=";
      };
    in [
      "${root}/ruby.satyh"
    ];
  }
)
