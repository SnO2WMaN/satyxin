(import ../create-pkg.nix) (
  {inputs, ...}: {
    name = "bibyfi";
    version = inputs.pkg-satysfi-bibyfi.rev;
    sources = let
      root = inputs.pkg-satysfi-bibyfi;
    in [
      "${root}/bibyfi.satyh"
      "${root}/bibyfi-IEEETran.satyh"
    ];
  }
)
