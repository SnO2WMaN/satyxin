(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "figbox";
    version = inputs.pkg-satysfi-figbox.rev;
    sources = let
      root = inputs.pkg-satysfi-figbox;
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      dist
    ];
  }
)
