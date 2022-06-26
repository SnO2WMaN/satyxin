(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "railway";
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
