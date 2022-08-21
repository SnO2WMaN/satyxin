(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "class-stjarticle";
    version = inputs.pkg-satysfi-class-stjarticle.rev;
    sources = let
      root = inputs.pkg-satysfi-class-stjarticle;
    in [
      "${root}/stjarticle.satyh"
    ];
  }
)
