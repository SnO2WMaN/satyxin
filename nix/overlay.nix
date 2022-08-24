final: prev: {
  satyxin = import ./. {pkgs = final;};

  satyxinPackages = with final.lib; (
    listToAttrs (
      map (name: {
        name = name;
        value = final.callPackage ../pkgs/${name} {};
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
