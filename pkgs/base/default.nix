(import ../create-pkg.nix) (
  {inputs, ...}: {
    name = "base";
    version = inputs.pkg-satysfi-base.rev;
    sources = let
      root = inputs.pkg-satysfi-base;
    in [
      "${root}/src"
    ];
  }
)
