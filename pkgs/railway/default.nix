(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "railway";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      base
      dist
    ];
  }
)
