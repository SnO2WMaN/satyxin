(import ../create-pkg.nix)
(
  {inputs, ...}: {
    name = "uline";
    version = inputs.pkg-satysfi-uline.rev;
    sources = let
      root = inputs.pkg-satysfi-uline;
    in [
      "${root}/uline.satyh"
    ];
  }
)
