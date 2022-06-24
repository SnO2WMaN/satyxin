final: prev: rec {
  satyxinPackages = let
    satyxinPkgs = builtins.listToAttrs (
      map (name: {
        name = name;
        value = (import ./pkgs/${name}) {
          pkgs = prev;
          satyxinPkgs = satyxinPkgs;
        };
      }) [
        "azmath"
        "base"
        "bibyfi"
        "code-printer"
        "easytable"
        "fonts-dejavu"
        "fonts-junicode"
        "fss"
        "uline"
      ]
    );
  in
    satyxinPkgs;
}
