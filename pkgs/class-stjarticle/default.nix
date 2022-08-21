(import ../create-pkg.nix) (
  {pkgs, ...}: rec {
    name = "class-stjarticle";
    version = "9381bee930818464e76cdc4622eb381a1aba164f";
    sources = let
      root = pkgs.fetchFromGitHub {
        owner = "puripuri2100";
        repo = "stjarticle";
        rev = version;
        sha256 = "sha256-95D2nKVMDbvwNyppPNTzXxf1p6FzGiyLd9o81gh1S8g=";
      };
    in [
      "${root}/stjarticle.satyh"
    ];
  }
)
