(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "pagenumber";
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
