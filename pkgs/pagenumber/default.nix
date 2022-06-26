(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "pagenumber";
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
