(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "algorithm";
    version = inputs.pkg-satysfi-algorithm.rev;
    sources = [
      "${inputs.pkg-satysfi-algorithm}/src"
    ];
    deps = with pkgs.satyxinPackages; [
      dist
      base
      fss
    ];
  }
)
