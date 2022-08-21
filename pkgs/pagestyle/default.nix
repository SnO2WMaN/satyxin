(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "pagestyle";
    version = inputs.pkg-satysfi-pagestyle.rev;
    sources = let
      root = inputs.pkg-satysfi-pagestyle;
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      dist
      fss
      pagenumber
    ];
  }
)
