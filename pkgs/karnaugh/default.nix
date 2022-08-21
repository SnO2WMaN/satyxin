(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "karnaugh";
    version = inputs.pkg-satysfi-karnaugh.rev;
    sources = let
      root = inputs.pkg-satysfi-karnaugh;
    in [
      "${root}/karnaugh.satyh"
    ];
  }
)
