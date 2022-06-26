(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "enumitem";
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
