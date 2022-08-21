(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "enumitem";
    version = inputs.pkg-satysfi-enumitem.rev;
    sources = let
      root = inputs.pkg-satysfi-enumitem;
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
    ];
  }
)
