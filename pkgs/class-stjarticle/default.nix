(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "class-stjarticle";
    sources = {
      files = [
        "./stjarticle.satyh"
      ];
    };
  }
)
