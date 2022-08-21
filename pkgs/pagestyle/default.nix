(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "pagestyle";
    version = inputs.pkg-satysfi-pagestyle.rev;
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      base
      dist
      fss
      pagenumber
    ];
  }
)
