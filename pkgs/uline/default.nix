(import ../create-pkg.nix)
(
  {inputs, ...}: {
    name = "uline";
    version = inputs.pkg-satysfi-uline.rev;
    sources = {
      files = [
        "./uline.satyh"
      ];
    };
  }
)
