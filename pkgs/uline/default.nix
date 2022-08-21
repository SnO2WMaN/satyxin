(import ../create-pkg.nix)
(
  {inputs, ...}: {
    name = "uline";
    src = inputs.pkg-satysfi-uline;
    version = inputs.pkg-satysfi-uline.rev;
    sources = {
      files = [
        "./uline.satyh"
      ];
    };
  }
)
