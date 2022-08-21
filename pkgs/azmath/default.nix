(import ../create-pkg.nix)
(
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "azmath";
    version = inputs.pkg-satysfi-azmath.rev;
    sources = let
      root = inputs.pkg-satysfi-azmath;
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [base];
  }
)
