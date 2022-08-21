(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "karnaugh";
    sources = {
      files = [
        "./karnaugh.satyh"
      ];
    };
  }
)
