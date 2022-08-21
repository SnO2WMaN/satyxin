(import ../create-pkg.nix)
(
  {pkgs, ...}: {
    name = "azmath";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [base];
  }
)
