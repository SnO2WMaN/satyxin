(import ../create-pkg.nix) (
  {pkgs, ...}: {
    name = "pagestyle";
    sources = {
      dirs = [
        "./src"
      ];
    };
    deps = with pkgs.satyxinPackages; [
      base
      dist
      fss
      pagenumber
    ];
  }
)
