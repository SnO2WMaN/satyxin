(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "karnaugh";
    version = inputs.pkg-satysfi-karnaugh.rev;
    sources = {
      files = [
        "./karnaugh.satyh"
      ];
    };
  }
)
