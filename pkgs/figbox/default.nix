(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "figbox";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with satyxinPkgs; [
      base
      dist
    ];
  }
)
