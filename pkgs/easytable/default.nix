(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "easytable";
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
