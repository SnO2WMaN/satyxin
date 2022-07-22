final: prev: {
  satysfi-formatter = final.callPackage ./tools/satysfi-formatter {};
  satysfi-language-server = final.callPackage ./tools/satysfi-language-server {};

  satyxin = import ./nix {pkgs = final;};

  satyxinPackages = (
    builtins.listToAttrs (
      map (name: {
        name = name;
        value = prev.callPackage (import ./pkgs/${name}) {};
      }) [
        "algorithm"
        "azmath"
        "base"
        "bibyfi"
        "chemfml"
        "class-jlreq"
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
        "pagenumber"
        "pagestyle"
        "railway"
        "ruby"
        "uline"
      ]
    )
  );
}
