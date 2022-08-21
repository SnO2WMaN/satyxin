(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "code-printer";
    version = "1.1.1";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "puripuri2100";
        repo = "satysfi-code-printer";
        rev = version;
        sha256 = "sha256-QyA8XJKgZDQUEMyDfFJiDra9jYZ5+E3gYSdNTmTEYGw=";
      };
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      psuedo-fonts-dejavu
    ];
  }
)
