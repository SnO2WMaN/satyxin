(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "chemfml";
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
