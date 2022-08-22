inputs: final: prev: {
  satysfi-formatter = final.callPackage ../tools/satysfi-formatter {};
  satysfi-formatter-each = final.callPackage ../tools/satysfi-formatter/each.nix {};

  satyxin = import ./. {pkgs = final;};

  satyxinPackages = with final.lib; (
    listToAttrs (
      map (name: {
        name = name;
        value = import ../pkgs/${name} {
          pkgs = final;
          inputs = inputs;
        };
      }) [
        "algorithm"
        "azmath"
        "base"
        "bibyfi"
        "chemfml"
        "class-jlreq"
        "class-slydifi"
        "class-stjarticle"
        "code-printer"
        "derive"
        "dist"
        "easytable"
        "enumitem"
        "figbox"
        "fss"
        "karnaugh"
        "pagenumber"
        "pagestyle"
        "psuedo-fonts-dejavu"
        "psuedo-fonts-junicode"
        "railway"
        "ruby"
        "uline"
        "zrbase"
      ]
    )
  );
}
