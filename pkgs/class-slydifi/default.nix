(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "class-slydifi";
    version = inputs.pkg-satysfi-class-slydifi.rev;
    sources = let
      root = inputs.pkg-satysfi-class-slydifi;
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      enumitem
      figbox
      base
      railway
    ];
  }
)
