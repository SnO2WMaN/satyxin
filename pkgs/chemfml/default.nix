(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "chemfml";
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
