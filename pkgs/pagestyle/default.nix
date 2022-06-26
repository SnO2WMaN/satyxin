(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "pagestyle";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with satyxinPkgs; [
      base
      dist
      fss
      pagenumber
    ];
  }
)
