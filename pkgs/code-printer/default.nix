(import ../create-pkg.nix) (
  {satyxinPkgs}: {
    name = "code-printer";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with satyxinPkgs; [
      base
      fonts-junicode
    ];
  }
)
