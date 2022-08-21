(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "code-printer";
    version = inputs.pkg-satysfi-code-printer.rev;
    sources = let
      root = inputs.pkg-satysfi-code-printer;
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      psuedo-fonts-dejavu
    ];
  }
)
