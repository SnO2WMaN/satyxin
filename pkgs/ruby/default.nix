(import ../create-pkg.nix) (
  {inputs, ...}: {
    name = "ruby";
    version = inputs.pkg-satysfi-ruby.rev;
    sources = {
      files = [
        "./ruby.satyh"
      ];
    };
  }
)
