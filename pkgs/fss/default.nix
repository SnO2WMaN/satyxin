(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "fss";
    version = inputs.pkg-satysfi-fss.rev;
    sources = {
      dirs = [
        "./src/fss"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      base
      dist
      fonts-junicode
    ];
  }
)
