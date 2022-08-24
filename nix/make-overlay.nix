inputs: final: prev: {
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
        "class-yabaitech"
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
        "psuedo-fonts-asana-math"
        "psuedo-fonts-junicode"
        "railway"
        "ruby"
        "uline"
        "zrbase"
      ]
    )
  );
}
