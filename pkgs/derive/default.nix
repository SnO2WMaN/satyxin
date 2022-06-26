(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "derive";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with satyxinPkgs; [
      base
    ];
  }
)
