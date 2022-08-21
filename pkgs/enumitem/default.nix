(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "enumitem";
    version = "3.0.1";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "monaqa";
        repo = "satysfi-enumitem";
        rev = "v${version}";
        sha256 = "sha256-daCBZg9ekY1/o+ey4hKjnrtlxrRYXKOb5huxf+0CsS0=";
      };
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
    ];
  }
)
