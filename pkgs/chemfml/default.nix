(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "chemfml";
    src = inputs.pkg-satysfi-chemfml;
    version = inputs.pkg-satysfi-chemfml.rev;
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      base
      dist
    ];
  }
)
