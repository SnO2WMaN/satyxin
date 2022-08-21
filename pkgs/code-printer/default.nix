(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "code-printer";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      base
      fonts-dejavu
    ];
  }
)
