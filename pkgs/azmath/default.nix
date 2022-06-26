(import ../create-pkg.nix)
(
  {satyxinPkgs}: {
    name = "azmath";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with satyxinPkgs; [base];
  }
)
