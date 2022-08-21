(import ../create-pkg.nix) (
  {inputs, ...}: {
    name = "base";
    src = inputs.pkg-satysfi-base;
    version = inputs.pkg-satysfi-base.rev;
    sources = {
      dirs = [
        "./src"
      ];
    };
  }
)
