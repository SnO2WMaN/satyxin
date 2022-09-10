final: prev: {
  satyxin = {
    buildSatysfiDist = final.callPackage ./build-satysfi-dist {};
    buildDocument = final.callPackage ./build-document {};
    buildPackage = final.callPackage ./build-package {};

    # internal
    internal = final.callPackage ./utils {};
  };

  satyxinPackages = with final.lib; (
    listToAttrs (
      map (name: {
        name = name;
        value = final.callPackage ./packages/${name} {};
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
        "psuedo-fonts-asana-math"
        "psuedo-fonts-dejavu"
        "psuedo-fonts-junicode"
        "psuedo-fonts-noto-sans-cjk-jp"
        "psuedo-fonts-noto-sans"
        "psuedo-fonts-noto-serif-cjk-jp"
        "psuedo-fonts-noto-serif"
        "railway"
        "ruby"
        "uline"
        "zrbase"
      ]
    )
  );
}
