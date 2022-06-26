(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "class-slydifi";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with satyxinPkgs; [
      enumitem
      figbox
      base
      railway
    ];
  }
)
