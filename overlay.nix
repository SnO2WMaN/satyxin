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
        "class-slydifi"
        "code-printer"
        "derive"
        "dist"
        "easytable"
        "enumitem"
        "figbox"
        "fonts-dejavu"
        "fonts-junicode"
        "fss"
        "karnaugh"
        "railway"
        "ruby"
        "uline"
      ]
    );
  in
    satyxinPkgs;
}
