(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "karnaugh";
    src = inputs.pkg-satysfi-karnaugh;
    version = inputs.pkg-satysfi-karnaugh.rev;
    sources = {
      files = [
        "./karnaugh.satyh"
      ];
    };
  }
)
