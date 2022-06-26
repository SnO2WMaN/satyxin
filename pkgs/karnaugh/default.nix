(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "karnaugh";
    sources = {
      files = [
        "./karnaugh.satyh"
      ];
    };
  }
)
