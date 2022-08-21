(import ../create-pkg.nix) (
  {inputs, ...}: {
    name = "ruby";
    src = inputs.pkg-satysfi-ruby;
    version = inputs.pkg-satysfi-ruby.rev;
    sources = {
      files = [
        "./ruby.satyh"
      ];
    };
  }
)
