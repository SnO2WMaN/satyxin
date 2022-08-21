(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "class-stjarticle";
    src = inputs.pkg-satysfi-class-stjarticle;
    version = inputs.pkg-satysfi-class-stjarticle.rev;
    sources = {
      files = [
        "./stjarticle.satyh"
      ];
    };
  }
)
