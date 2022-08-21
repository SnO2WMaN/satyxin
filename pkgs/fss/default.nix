(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "fss";
    sources = {
      dirs = [
        "./src/fss"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      base
      dist
      fonts-junicode
    ];
  }
)
