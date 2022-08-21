(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "class-slydifi";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      enumitem
      figbox
      base
      railway
    ];
  }
)
