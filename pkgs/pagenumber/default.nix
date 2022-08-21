(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "pagenumber";
    version = inputs.pkg-satysfi-pagenumber.rev;
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
