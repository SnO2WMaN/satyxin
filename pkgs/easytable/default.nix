(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "easytable";
    version = inputs.pkg-satysfi-easytable.rev;
    sources = let
      root = inputs.pkg-satysfi-easytable;
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
    ];
  }
)
