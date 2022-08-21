(import ../create-pkg.nix) (
  {inputs, ...}: {
    name = "ruby";
    version = inputs.pkg-satysfi-ruby.rev;
    sources = let
      root = inputs.pkg-satysfi-ruby;
    in [
      "${root}/ruby.satyh"
    ];
  }
)
