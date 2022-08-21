(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "railway";
    version = inputs.pkg-satysfi-railway.rev;
    sources = let
      root = inputs.pkg-satysfi-railway;
    in [
      "${root}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      base
      dist
    ];
  }
)
