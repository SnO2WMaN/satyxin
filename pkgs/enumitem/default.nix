(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "enumitem";
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
