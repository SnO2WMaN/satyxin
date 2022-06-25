(import ../../nix/create-pkg.nix) (
  {satyxinPkgs}: {
    name = "algorithm";
    sources = builtins.toJSON {
      dirs = [
        "./src"
      ];
    };
    deps = with satyxinPkgs; [
      base
      fss
    ];
  }
)
