(import ../../nix/create-pkg.nix) (
  {satyxinPkgs}: {
    name = "fss";
    sources = {
      dirs = [
        "./src/fss"
      ];
    };
    deps = with satyxinPkgs; [
      base
      dist
      fonts-junicode
    ];
  }
)
