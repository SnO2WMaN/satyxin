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
        "chemfml"
        "code-printer"
        "derive"
        "dist"
        "easytable"
        "figbox"
        "fonts-dejavu"
        "fonts-junicode"
        "fss"
        "ruby"
        "uline"
      ]
    );
  in
    satyxinPkgs;
}
