(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "ruby";
    sources = {
      files = [
        "./ruby.satyh"
      ];
    };
  }
)
