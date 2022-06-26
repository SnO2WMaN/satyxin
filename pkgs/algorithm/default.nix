(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "algorithm";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with satyxinPkgs; [
      dist
      base
      fss
    ];
  }
)
