final: prev: {
  satyxin = import ./nix {pkgs = prev;};
  satyxinPackages = let
    satyxinPkgs = builtins.listToAttrs (
      map (name: {
        name = name;
        value = (import ./pkgs/${name}) {
          pkgs = prev;
          satyxinPkgs = satyxinPkgs;
        };
      }) [
        "algorithm"
        "azmath"
        "base"
        "bibyfi"
        "code-printer"
        "easytable"
        "dist"
        "fonts-dejavu"
        "fonts-junicode"
        "fss"
        "uline"
      ]
    );
  in
    satyxinPkgs;
}
