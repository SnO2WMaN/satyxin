(import ../create-pkg.nix) (
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "code-printer";
    src = inputs.pkg-satysfi-code-printer;
    version = inputs.pkg-satysfi-code-printer.rev;
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      base
      fonts-dejavu
    ];
  }
)
