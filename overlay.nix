externalPkgs: final: prev: {
  satysfi-formatter = final.callPackage ./tools/satysfi-formatter {};
  satysfi-formatter-each = final.callPackage ./tools/satysfi-formatter/each.nix {};
  satysfi-language-server = final.callPackage ./tools/satysfi-language-server {};

  satyxin = import ./nix {pkgs = final;};

  satyxinPackages = with final.lib; (
    (mapAttrs (key: value: final.callPackage value {}) externalPkgs)
    // (
      listToAttrs (
        map (name: {
          name = name;
          value = final.callPackage (import ./pkgs/${name}) {};
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
    )
  );
}
