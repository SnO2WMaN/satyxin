(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "derive";
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
