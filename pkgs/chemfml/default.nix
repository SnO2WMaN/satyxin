(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "chemfml";
    version = inputs.pkg-satysfi-chemfml.rev;
    sources = let
      root = inputs.pkg-satysfi-chemfml;
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      dist
    ];
  }
)
