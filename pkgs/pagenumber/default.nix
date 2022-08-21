(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "pagenumber";
    version = inputs.pkg-satysfi-pagenumber.rev;
    sources = let
      root = inputs.pkg-satysfi-pagenumber;
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      dist
    ];
  }
)
