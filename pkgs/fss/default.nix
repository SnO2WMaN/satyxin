(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "fss";
    version = inputs.pkg-satysfi-fss.rev;
    sources = let
      root = inputs.pkg-satysfi-fss;
    in [
      "${root}/src/fss"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      dist
      fonts-junicode
    ];
  }
)
