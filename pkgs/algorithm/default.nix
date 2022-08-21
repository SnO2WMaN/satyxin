(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "algorithm";
    version = inputs.pkg-satysfi-algorithm.rev;
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      dist
      base
      fss
    ];
  }
)
