(import ../create-pkg.nix) (
  {
    pkgs,
    fetchFromGitHub,
    satyxinPackages,
    ...
  }: rec {
    name = "ruby";
    version = "0.1.2";
    sources = let
      root = fetchFromGitHub {
        owner = "puripuri2100";
        repo = "SATySFi-ruby";
        rev = version;
        sha256 = "sha256-GEOXhem78zZqtjx4I1iXNtiA+wy6AgU6Y1rJZZ3hLEA=";
      };
    in [
      "${root}/ruby.satyh"
    ];
  }
)
