(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "easytable";
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
