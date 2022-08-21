(import ../create-pkg.nix)
(
  {
    pkgs,
    inputs,
    ...
  }: {
    name = "azmath";
    version = inputs.pkg-satysfi-azmath.rev;
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [base];
  }
)
