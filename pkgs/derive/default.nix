(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "derive";
    version = inputs.pkg-satysfi-derive.rev;
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      base
    ];
  }
)
