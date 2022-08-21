(import ../create-pkg.nix) (
  {inputs, ...}: {
    name = "bibyfi";
    version = inputs.pkg-satysfi-base.rev;
    sources = {
      files = [
        "./bibyfi.satyh"
        "./bibyfi-IEEETran.satyh"
      ];
    };
  }
)
