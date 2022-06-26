(import ../create-pkg.nix) (
  {...}: {
    name = "bibyfi";
    sources = {
      files = [
        "./bibyfi.satyh"
        "./bibyfi-IEEETran.satyh"
      ];
    };
  }
)
