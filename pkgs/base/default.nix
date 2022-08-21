(import ../create-pkg.nix) (
  {inputs, ...}: {
    name = "base";
    version = inputs.pkg-satysfi-base.rev;
    sources = {
      dirs = [
        "./src"
      ];
    };
  }
)
