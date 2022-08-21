(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "derive";
    version = inputs.pkg-satysfi-derive.rev;
    sources = let
      root = inputs.pkg-satysfi-derive;
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
    ];
  }
)
