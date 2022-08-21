(import ../create-pkg.nix) (
  {inputs, ...}: {
    name = "bibyfi";
    src = inputs.pkg-satysfi-bibyfi;
    version = inputs.pkg-satysfi-bibyfi.rev;
    sources = {
      files = [
        "./bibyfi.satyh"
        "./bibyfi-IEEETran.satyh"
      ];
    };
  }
)
