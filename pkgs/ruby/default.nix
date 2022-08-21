(import ../create-pkg.nix) (
  {...}: {
    name = "ruby";
    sources = {
      files = [
        "./ruby.satyh"
      ];
    };
  }
)
