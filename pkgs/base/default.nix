(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "base";
    version = inputs.pkg-satysfi-base.rev;
    sources = let
      root = inputs.pkg-satysfi-base;
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      zrbase
    ];
  }
)
