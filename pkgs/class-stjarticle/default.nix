(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "class-stjarticle";
    sources = {
      files = [
        "./stjarticle.satyh"
      ];
    };
  }
)
