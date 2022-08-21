(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "algorithm";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      dist
      base
      fss
    ];
  }
)
